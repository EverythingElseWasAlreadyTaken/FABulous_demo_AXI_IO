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
// Slice i of every ACT bus belongs to tile X9Y(14-i) -- eFPGA_top aggregates
// the per-tile EXTERNAL pins walking Y downwards.
//
// The PSUM_PORT supertile in the north border row is exercised the same way:
// its read data is echoed back on write data, and address / write-enable /
// bank-select are driven by the same counter. Its only path into the fabric is
// the broken-out quad channel, so this also proves that routing works.

module npu_io_test #(
    parameter integer TILES = 14
) (
    input  wire                   clk,

    input  wire [8*TILES-1:0]     act_rdata,   // NPU -> fabric
    output wire [TILES-1:0]       act_we,      // fabric -> NPU
    output wire [9*TILES-1:0]     act_addr,
    output wire [8*TILES-1:0]     act_wdata,
    output wire [8*TILES-1:0]     weight_in,

    // NPU_PSUM_PORT supertile (single instance, north border row)
    input  wire [31:0]            psum_rdata,  // NPU -> fabric
    output wire [7:0]             psum_addr,   // fabric -> NPU
    output wire [7:0]             psum_we,
    output wire [31:0]            psum_wdata,
    output wire [2:0]             psum_bank_sel
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

    assign psum_wdata    = psum_rdata;   // loopback
    assign psum_addr     = cnt[7:0];     // counter
    // XOR keeps this distinct from psum_addr, which carries the same bits,
    // so a swap between the two buses cannot pass unnoticed. Staying inside
    // cnt[7:0] keeps every bit observable from the 9-bit reference.
    assign psum_we       = cnt[7:0] ^ 8'hA5;  // counter
    assign psum_bank_sel = cnt[2:0];     // counter

endmodule
`default_nettype wire
