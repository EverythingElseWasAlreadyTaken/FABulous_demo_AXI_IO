`default_nettype none

// Basic-IO test for the NPU_ACT_ROW tiles.
//
// Like axi_io_test, every fabric-facing pin of every NPU_ACT_ROW BEL is
// exercised as a plain IO rather than as a real activation-SRAM access:
//   * the 8 RDATA bits each tile receives from the NPU are echoed back on
//     WDATA (straight) and WEIGHT_IN (inverted),
//   * ADDR and WE are driven by a free-running counter.
// The testbench cross-checks both against its own copy of the counter, so a
// mis-routed or swapped switch-matrix connection cannot pass.
//
// Slice i of every bus belongs to tile X9Y(14-i) -- eFPGA_top aggregates the
// per-tile EXTERNAL pins walking Y downwards.

module npu_io_test #(
    parameter integer TILES = 14
) (
    input  wire                   clk,

    input  wire [8*TILES-1:0]     act_rdata,   // NPU -> fabric
    output wire [TILES-1:0]       act_we,      // fabric -> NPU
    output wire [9*TILES-1:0]     act_addr,
    output wire [8*TILES-1:0]     act_wdata,
    output wire [8*TILES-1:0]     weight_in
);

    // Control comes in on the first tile's RDATA, since this fabric has no
    // general-purpose IO pads left in the grid.
    wire rst = act_rdata[0];
    wire en  = act_rdata[1];

    reg [31:0] cnt;
    always @(posedge clk)
        if (en)
            if (rst) cnt <= 32'b0;
            else cnt <= cnt + 1'b1;
        else cnt <= cnt;

    genvar i;
    generate
        for (i = 0; i < TILES; i = i + 1) begin : g_tile
            assign act_wdata[8*i +: 8] =  act_rdata[8*i +: 8];       // loopback
            assign weight_in[8*i +: 8] = ~act_rdata[8*i +: 8];       // inverted loopback
            // XOR with the tile index so a swap between tiles is visible
            assign act_addr[9*i +: 9]  = cnt[8:0] ^ i[8:0];          // counter
            assign act_we[i]           = cnt[i];                     // counter
        end
    endgenerate

endmodule
`default_nettype wire
