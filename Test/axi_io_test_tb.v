`ifndef VERILATOR
`timescale 1ps / 1ps
`default_nettype none

module axi_io_test_tb ();
    // The grid holds no E_IO/W_IO tiles any more, so there are no I_top/O_top/
    // T_top pads: the counter controls ride on spare AXI slave inputs instead.
    reg rst = 1'b1;
    reg en  = 1'b0;

    wire [15:0] config_access_c;

    reg         CLK                 = 1'b0 ;
    reg         resetn              = 1'b1 ;
    reg         self_write_strobe   = 1'b0 ;
    reg  [31:0] self_write_data     = 32'b0;
    reg         rx                  = 1'b1 ;
    wire        com_active                 ;
    wire        receive_led                ;
    reg         s_clk               = 1'b0 ;
    reg         s_data              = 1'b0 ;
    reg         config_done         = 1'b0 ;

    // AXI4-Lite slave SOC interface (testbench drives the "SOC" inputs)
    wire [9:0]  axil_s_araddr;
    wire        axil_s_arvalid;
    wire        axil_s_arready;
    wire [9:0]  axil_s_awaddr;
    wire        axil_s_awvalid;
    wire        axil_s_awready;
    wire        axil_s_bready;
    wire [1:0]  axil_s_bresp;
    wire        axil_s_bvalid;
    wire [31:0] axil_s_rdata;
    wire        axil_s_rready;
    wire [1:0]  axil_s_rresp;
    wire        axil_s_rvalid;
    wire [31:0] axil_s_wdata;
    wire        axil_s_wready;
    wire [3:0]  axil_s_wstrb;
    wire        axil_s_wvalid;

    // AXI4 full master SOC interface
    wire [31:0] axi_m_araddr;
    wire [1:0]  axi_m_arburst;
    wire [7:0]  axi_m_arlen;
    wire        axi_m_arready;
    wire [2:0]  axi_m_arsize;
    wire        axi_m_arvalid;
    wire [31:0] axi_m_awaddr;
    wire [1:0]  axi_m_awburst;
    wire [7:0]  axi_m_awlen;
    wire        axi_m_awready;
    wire [2:0]  axi_m_awsize;
    wire        axi_m_awvalid;
    wire        axi_m_bready;
    wire [1:0]  axi_m_bresp;
    wire        axi_m_bvalid;
    wire [31:0] axi_m_rdata;
    wire        axi_m_rlast;
    wire        axi_m_rready;
    wire [1:0]  axi_m_rresp;
    wire        axi_m_rvalid;
    wire [31:0] axi_m_wdata;
    wire        axi_m_wlast;
    wire        axi_m_wready;
    wire [3:0]  axi_m_wstrb;
    wire        axi_m_wvalid;

    // Instantiate the fabric
    eFPGA_top top_i (
        .AXIL_S_SOC_ARADDR (axil_s_araddr ),
        .AXIL_S_SOC_ARREADY(axil_s_arready),
        .AXIL_S_SOC_ARVALID(axil_s_arvalid),
        .AXIL_S_SOC_AWADDR (axil_s_awaddr ),
        .AXIL_S_SOC_AWREADY(axil_s_awready),
        .AXIL_S_SOC_AWVALID(axil_s_awvalid),
        .AXIL_S_SOC_BREADY (axil_s_bready ),
        .AXIL_S_SOC_BRESP  (axil_s_bresp  ),
        .AXIL_S_SOC_BVALID (axil_s_bvalid ),
        .AXIL_S_SOC_RDATA  (axil_s_rdata  ),
        .AXIL_S_SOC_RREADY (axil_s_rready ),
        .AXIL_S_SOC_RRESP  (axil_s_rresp  ),
        .AXIL_S_SOC_RVALID (axil_s_rvalid ),
        .AXIL_S_SOC_WDATA  (axil_s_wdata  ),
        .AXIL_S_SOC_WREADY (axil_s_wready ),
        .AXIL_S_SOC_WSTRB  (axil_s_wstrb  ),
        .AXIL_S_SOC_WVALID (axil_s_wvalid ),
        .AXI_M_SOC_ARADDR  (axi_m_araddr  ),
        .AXI_M_SOC_ARBURST (axi_m_arburst ),
        .AXI_M_SOC_ARLEN   (axi_m_arlen   ),
        .AXI_M_SOC_ARREADY (axi_m_arready ),
        .AXI_M_SOC_ARSIZE  (axi_m_arsize  ),
        .AXI_M_SOC_ARVALID (axi_m_arvalid ),
        .AXI_M_SOC_AWADDR  (axi_m_awaddr  ),
        .AXI_M_SOC_AWBURST (axi_m_awburst ),
        .AXI_M_SOC_AWLEN   (axi_m_awlen   ),
        .AXI_M_SOC_AWREADY (axi_m_awready ),
        .AXI_M_SOC_AWSIZE  (axi_m_awsize  ),
        .AXI_M_SOC_AWVALID (axi_m_awvalid ),
        .AXI_M_SOC_BREADY  (axi_m_bready  ),
        .AXI_M_SOC_BRESP   (axi_m_bresp   ),
        .AXI_M_SOC_BVALID  (axi_m_bvalid  ),
        .AXI_M_SOC_RDATA   (axi_m_rdata   ),
        .AXI_M_SOC_RLAST   (axi_m_rlast   ),
        .AXI_M_SOC_RREADY  (axi_m_rready  ),
        .AXI_M_SOC_RRESP   (axi_m_rresp   ),
        .AXI_M_SOC_RVALID  (axi_m_rvalid  ),
        .AXI_M_SOC_WDATA   (axi_m_wdata   ),
        .AXI_M_SOC_WLAST   (axi_m_wlast   ),
        .AXI_M_SOC_WREADY  (axi_m_wready  ),
        .AXI_M_SOC_WSTRB   (axi_m_wstrb   ),
        .AXI_M_SOC_WVALID  (axi_m_wvalid  ),
        .Config_accessC    (config_access_c),
        .CLK               (CLK            ),
        .resetn            (resetn         ),
        .SelfWriteStrobe   (self_write_strobe),
        .SelfWriteData     (self_write_data  ),
        .Rx                (rx             ),
        .ComActive         (com_active      ),
        .ReceiveLED        (receive_led     ),
        .s_clk             (s_clk          ),
        .s_data            (s_data         )
    );

    // ------------------------------------------------------------------
    // Basic-IO stimulus: drive every AXI "SOC" input with a toggling pattern.
    // ------------------------------------------------------------------
    reg         go = 1'b0;
    reg  [31:0] tb_cnt = 32'b0;
    always @(posedge CLK) if (go) tb_cnt <= tb_cnt + 1'b1;

    assign axil_s_awaddr  = tb_cnt[9:0];
    assign axil_s_awvalid = tb_cnt[0];
    assign axil_s_wdata   = ~tb_cnt;
    assign axil_s_wstrb   = {tb_cnt[7:6], en, rst};
    assign axil_s_wvalid  = tb_cnt[1];
    assign axil_s_bready  = tb_cnt[2];
    assign axil_s_araddr  = tb_cnt[19:10];
    assign axil_s_arvalid = tb_cnt[3];
    assign axil_s_rready  = tb_cnt[4];

    assign axi_m_awready  = tb_cnt[5];
    assign axi_m_wready   = tb_cnt[6];
    assign axi_m_bresp    = tb_cnt[8:7];
    assign axi_m_bvalid   = tb_cnt[7];
    assign axi_m_arready  = tb_cnt[8];
    assign axi_m_rdata    = tb_cnt;
    assign axi_m_rresp    = tb_cnt[10:9];
    assign axi_m_rlast    = tb_cnt[9];
    assign axi_m_rvalid   = tb_cnt[10];

    localparam integer MAX_BITBYTES = 16384;
    reg [7:0] bitstream [MAX_BITBYTES];

    always #500000 CLK = (CLK === 1'b0);

    integer i;
    reg     have_errors = 1'b0;
    reg [31:0] prev_wdata = 32'b0;

    reg [2047:0] bitstream_hex_arg  ;
    reg [2047:0] output_waveform_arg;

`ifdef GL_SIM
    `include "force_block.vh"
`endif

    initial begin

        if ($value$plusargs("output_waveform=%s", output_waveform_arg)) begin
            $dumpfile(output_waveform_arg);
            $dumpvars(0, axi_io_test_tb);
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
        // Reset the counter, then let it run.
        rst = 1'b1; en = 1'b1;
        repeat (5) @(posedge CLK);
        rst = 1'b0;
        go = 1'b1;

        // Run the basic-IO checks for many cycles.
        for (i = 0; i < 2000; i = i + 1) begin
            @(negedge CLK);

            // Counter-driven AXI outputs
            if (axil_s_rdata   !== axi_m_wdata) have_errors = 1'b1;
            if (axil_s_bresp   !== axi_m_wdata[1:0]) have_errors = 1'b1;
            if (axil_s_rresp   !== axi_m_wdata[3:2]) have_errors = 1'b1;
            if (axi_m_awsize[2] !== axi_m_wdata[0]) have_errors = 1'b1;
            if (axi_m_arsize[2] !== axi_m_wdata[1]) have_errors = 1'b1;
            if (i > 0 && axi_m_wdata !== prev_wdata + 32'd1) have_errors = 1'b1;
            prev_wdata = axi_m_wdata;

            // Loopback AXI outputs
            if (axi_m_awaddr   !== axi_m_rdata)   have_errors = 1'b1;
            if (axi_m_awlen    !== axil_s_awaddr[7:0]) have_errors = 1'b1;
            if (axi_m_awsize[1:0] !== axil_s_awaddr[9:8]) have_errors = 1'b1;
            if (axi_m_awburst  !== axi_m_bresp)   have_errors = 1'b1;
            if (axi_m_awvalid  !== axi_m_awready) have_errors = 1'b1;
            if (axi_m_wstrb    !== axil_s_wstrb)  have_errors = 1'b1;
            if (axi_m_wlast    !== axi_m_rlast)   have_errors = 1'b1;
            if (axi_m_wvalid   !== axi_m_wready)  have_errors = 1'b1;
            if (axi_m_bready   !== axi_m_bvalid)  have_errors = 1'b1;
            if (axi_m_araddr   !== axil_s_wdata)  have_errors = 1'b1;
            if (axi_m_arlen    !== axil_s_araddr[7:0]) have_errors = 1'b1;
            if (axi_m_arsize[1:0] !== axil_s_araddr[9:8]) have_errors = 1'b1;
            if (axi_m_arburst  !== axi_m_rresp)   have_errors = 1'b1;
            if (axi_m_arvalid  !== axi_m_arready) have_errors = 1'b1;
            if (axi_m_rready   !== axi_m_rvalid)  have_errors = 1'b1;
            if (axil_s_awready !== axil_s_awvalid) have_errors = 1'b1;
            if (axil_s_wready  !== axil_s_wvalid)  have_errors = 1'b1;
            if (axil_s_bvalid  !== axil_s_bready)  have_errors = 1'b1;
            if (axil_s_arready !== axil_s_arvalid) have_errors = 1'b1;
            if (axil_s_rvalid  !== axil_s_rready)  have_errors = 1'b1;

            if (have_errors) begin
                $display("ERROR at cycle %0d (tb_cnt=0x%X)", i, tb_cnt);
                $display("  counter:  wdata=0x%X rdata=0x%X bresp=%b rresp=%b awsize[2]=%b arsize[2]=%b",
                         axi_m_wdata, axil_s_rdata, axil_s_bresp, axil_s_rresp,
                         axi_m_awsize[2], axi_m_arsize[2]);
                $display("  loopback: awaddr=0x%X rdata=0x%X | araddr=0x%X wdata=0x%X",
                         axi_m_awaddr, axi_m_rdata, axi_m_araddr, axil_s_wdata);
                $fatal;
            end
        end

        $display("TEST PASSED");
        $finish;
    end

endmodule
`endif
`default_nettype wire
