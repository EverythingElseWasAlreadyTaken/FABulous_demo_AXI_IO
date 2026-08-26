`timescale 1ns / 1ps

// Small self-checking testbench for the NPU_ACT_ROW BEL.
//
// The BEL is a pure pad-style passthrough between the fabric side (routed by
// the tile switch matrix) and the NPU side (EXTERNAL pins promoted to tile
// ports). This checks both directions, including that no bit is swapped or
// dropped in the vector expansion, which is the failure mode that matters when
// the switch-matrix .list wires the ports up by index.
//
// Runs standalone, no bitstream required:
//   iverilog -g2012 -s npu_act_row_tb -o npu_act_row_tb.vvp \
//       ../Tile/NPU_ACT_ROW/NPU_ACT_ROW_BEL.v npu_act_row_tb.v
//   vvp npu_act_row_tb.vvp

module npu_act_row_tb;

    // fabric side
    reg        FAB_ACT_WE;
    reg  [8:0] FAB_ACT_ADDR;
    reg  [7:0] FAB_ACT_WDATA;
    reg  [7:0] FAB_WEIGHT_IN;
    wire [7:0] FAB_ACT_RDATA;

    // NPU side
    wire       NPU_ACT_WE;
    wire [8:0] NPU_ACT_ADDR;
    wire [7:0] NPU_ACT_WDATA;
    wire [7:0] NPU_WEIGHT_IN;
    reg  [7:0] NPU_ACT_RDATA;

    integer errors = 0;
    integer i;

    NPU_ACT_ROW_BEL dut (
        .NPU_ACT_WE   (NPU_ACT_WE),
        .NPU_ACT_ADDR (NPU_ACT_ADDR),
        .NPU_ACT_WDATA(NPU_ACT_WDATA),
        .NPU_ACT_RDATA(NPU_ACT_RDATA),
        .NPU_WEIGHT_IN(NPU_WEIGHT_IN),
        .FAB_ACT_WE   (FAB_ACT_WE),
        .FAB_ACT_ADDR (FAB_ACT_ADDR),
        .FAB_ACT_WDATA(FAB_ACT_WDATA),
        .FAB_ACT_RDATA(FAB_ACT_RDATA),
        .FAB_WEIGHT_IN(FAB_WEIGHT_IN)
    );

    task check;
        input [255:0] name;
        input [31:0]  got;
        input [31:0]  exp;
        begin
            if (got !== exp) begin
                $display("FAIL %0s: got %h expected %h", name, got, exp);
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        // walking-one over every fabric->NPU bit, so a swapped or stuck index
        // cannot pass by coincidence
        for (i = 0; i < 9; i = i + 1) begin
            FAB_ACT_WE    = i[0];
            FAB_ACT_ADDR  = 9'b1 << i;
            FAB_ACT_WDATA = 8'b1 << (i % 8);
            FAB_WEIGHT_IN = 8'h80 >> (i % 8);
            NPU_ACT_RDATA = 8'b1 << (i % 8);
            #1;
            check("NPU_ACT_WE",    {31'b0, NPU_ACT_WE}, {31'b0, FAB_ACT_WE});
            check("NPU_ACT_ADDR",  {23'b0, NPU_ACT_ADDR},  {23'b0, FAB_ACT_ADDR});
            check("NPU_ACT_WDATA", {24'b0, NPU_ACT_WDATA}, {24'b0, FAB_ACT_WDATA});
            check("NPU_WEIGHT_IN", {24'b0, NPU_WEIGHT_IN}, {24'b0, FAB_WEIGHT_IN});
            check("FAB_ACT_RDATA", {24'b0, FAB_ACT_RDATA}, {24'b0, NPU_ACT_RDATA});
        end

        // a few random vectors on top of the structural sweep
        for (i = 0; i < 32; i = i + 1) begin
            FAB_ACT_WE    = $random;
            FAB_ACT_ADDR  = $random;
            FAB_ACT_WDATA = $random;
            FAB_WEIGHT_IN = $random;
            NPU_ACT_RDATA = $random;
            #1;
            check("rand NPU_ACT_ADDR",  {23'b0, NPU_ACT_ADDR},  {23'b0, FAB_ACT_ADDR});
            check("rand NPU_ACT_WDATA", {24'b0, NPU_ACT_WDATA}, {24'b0, FAB_ACT_WDATA});
            check("rand NPU_WEIGHT_IN", {24'b0, NPU_WEIGHT_IN}, {24'b0, FAB_WEIGHT_IN});
            check("rand FAB_ACT_RDATA", {24'b0, FAB_ACT_RDATA}, {24'b0, NPU_ACT_RDATA});
        end

        if (errors == 0)
            $display("npu_act_row_tb: PASS");
        else begin
            $display("npu_act_row_tb: FAIL (%0d errors)", errors);
            $fatal(1);
        end
        $finish;
    end

endmodule
