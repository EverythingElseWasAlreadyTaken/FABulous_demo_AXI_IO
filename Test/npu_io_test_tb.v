`ifndef VERILATOR
`timescale 1ps / 1ps
`default_nettype none

// Basic-IO testbench for the NPU_ACT_ROW tiles, in the style of
// axi_io_test_tb: configure the fabric with the npu_io_test bitstream, then
// check every NPU pin of every tile against a counter running in parallel.
//
// The design's counter is observable directly on NPU_ACT_WE (act_we[i] is
// cnt[i], so the bus *is* cnt[13:0]) and, XORed with the tile index, on the
// 9-bit NPU_ACT_ADDR slices. Bus slice i belongs to tile X9Y(14-i).

module npu_io_test_tb ();

    localparam integer TILES = 14;

    reg         CLK               = 1'b0 ;
    reg         resetn            = 1'b1 ;
    reg         self_write_strobe = 1'b0 ;
    reg  [31:0] self_write_data   = 32'b0;
    reg         rx                = 1'b1 ;
    wire        com_active               ;
    wire        receive_led              ;
    reg         s_clk             = 1'b0 ;
    reg         s_data            = 1'b0 ;
    reg         config_done       = 1'b0 ;

    wire [15:0] config_access_c;

    // NPU side of the tiles
    reg  [8*TILES-1:0] npu_act_rdata = 0;   // testbench -> fabric
    wire [TILES-1:0]   npu_act_we;          // fabric -> testbench
    wire [9*TILES-1:0] npu_act_addr;
    wire [8*TILES-1:0] npu_act_wdata;
    wire [8*TILES-1:0] npu_weight_in;

    eFPGA_top top_i (
        .Config_accessC  (config_access_c  ),
        .NPU_ACT_ADDR    (npu_act_addr     ),
        .NPU_ACT_RDATA   (npu_act_rdata    ),
        .NPU_ACT_WDATA   (npu_act_wdata    ),
        .NPU_ACT_WE      (npu_act_we       ),
        .NPU_WEIGHT_IN   (npu_weight_in    ),
        .CLK             (CLK              ),
        .resetn          (resetn           ),
        .SelfWriteStrobe (self_write_strobe),
        .SelfWriteData   (self_write_data  ),
        .Rx              (rx               ),
        .ComActive       (com_active       ),
        .ReceiveLED      (receive_led      ),
        .s_clk           (s_clk            ),
        .s_data          (s_data           )
    );

    // ------------------------------------------------------------------
    // Stimulus: the fabric has no general-purpose IO pads left in the grid,
    // so the design's reset/enable ride on the first tile's RDATA bits.
    // ------------------------------------------------------------------
    reg        go  = 1'b0;
    reg        rst = 1'b1;
    reg        en  = 1'b0;
    reg [31:0] tb_cnt = 32'b0;
    integer    t;

    always @(posedge CLK) begin
        if (go) tb_cnt <= tb_cnt + 1'b1;
        // a different walking pattern per tile, so a cross-tile swap shows up
        for (t = 0; t < TILES; t = t + 1)
            npu_act_rdata[8*t +: 8] <= tb_cnt[7:0] ^ (8'h5A + t[7:0]);
        npu_act_rdata[0] <= rst;
        npu_act_rdata[1] <= en;
    end

    localparam integer MAX_BITBYTES = 16384;
    reg [7:0] bitstream [MAX_BITBYTES];

    always #500000 CLK = (CLK === 1'b0);

    integer i;
    reg        have_errors = 1'b0;
    reg [8:0]  ref_cnt;
    reg [13:0] prev_we = 14'b0;

    reg [2047:0] bitstream_hex_arg  ;
    reg [2047:0] output_waveform_arg;

`ifdef GL_SIM
    `include "force_block.vh"
`endif

    initial begin

        if ($value$plusargs("output_waveform=%s", output_waveform_arg)) begin
            $dumpfile(output_waveform_arg);
            $dumpvars(0, npu_io_test_tb);
            $display("Output waveform set to %s", output_waveform_arg);
        end

`ifndef EMULATION

        if ($value$plusargs("bitstream_hex=%s", bitstream_hex_arg)) begin
            $readmemh(bitstream_hex_arg, bitstream);
            $display("Read bitstream hex from %s", bitstream_hex_arg);
        end else begin
            $display("Error: No bitstream provided as $plusargs bitstream_hex.");
            $fatal;
        end

        #100;
        resetn = 1'b0;
        #10000;
        resetn = 1'b1;
        #10000;
        repeat (20) @(posedge CLK);
        #2500;
        for (i = 0; i < MAX_BITBYTES; i = i + 4) begin
            self_write_data <= {bitstream[i], bitstream[i+1], bitstream[i+2], bitstream[i+3]};
            repeat (2) @(posedge CLK);
            self_write_strobe <= 1'b1;
            @(posedge CLK);
            self_write_strobe <= 1'b0;
            repeat (2) @(posedge CLK);
        end
`endif
        config_done = 1'b1;
        repeat (100) @(posedge CLK);
        // Reset the design counter, then let it run.
        rst = 1'b1; en = 1'b1;
        repeat (5) @(posedge CLK);
        rst = 1'b0;
        go  = 1'b1;
        repeat (3) @(posedge CLK);

        for (i = 0; i < 2000; i = i + 1) begin
            @(negedge CLK);

            // The counter, straight off the fabric.
            ref_cnt = npu_act_addr[8:0];
            if (npu_act_we[8:0] !== ref_cnt) have_errors = 1'b1;
            if (i > 0 && npu_act_we !== prev_we + 14'd1) have_errors = 1'b1;
            prev_we = npu_act_we;

            for (t = 0; t < TILES; t = t + 1) begin
                // counter on ADDR, XORed with the tile index
                if (npu_act_addr[9*t +: 9] !== (ref_cnt ^ t[8:0])) have_errors = 1'b1;
                // loopback on WDATA, inverted loopback on WEIGHT_IN
                if (npu_act_wdata[8*t +: 8] !==  npu_act_rdata[8*t +: 8]) have_errors = 1'b1;
                if (npu_weight_in[8*t +: 8] !== ~npu_act_rdata[8*t +: 8]) have_errors = 1'b1;
            end

            if (have_errors) begin
                $display("ERROR at cycle %0d (tb_cnt=0x%X)", i, tb_cnt);
                $display("  we=0x%X (prev 0x%X) ref_cnt=0x%X", npu_act_we, prev_we, ref_cnt);
                $display("  addr=0x%X", npu_act_addr);
                $display("  rdata =0x%X", npu_act_rdata);
                $display("  wdata =0x%X", npu_act_wdata);
                $display("  weight=0x%X", npu_weight_in);
                $fatal;
            end
        end

        $display("TEST PASSED");
        $finish;
    end

endmodule
`endif
`default_nettype wire
