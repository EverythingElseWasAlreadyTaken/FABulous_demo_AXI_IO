`default_nettype none

// Basic-IO loopback test for the custom AXI tiles.
//
// Every AXI FAB pin is exercised as a plain IO, not as an AXI-protocol
// transaction:
//   * 103 fabric-facing inputs are echoed back (loopback) on 103 outputs.
//   * The remaining 70 outputs are driven by a free-running counter.
//   * The counter low 16 bits are also exposed on the E_IO pads, so the
//     testbench can cross-check the counter against the AXI outputs.
//
// This verifies the routing of every single AXI tile signal.

module axi_io_test (
    input  wire        clk,

    input  wire [27:0] io_in,
    output wire [27:0] io_out,
    output wire [27:0] io_oeb,

    // AXI4-Lite slave FAB pins (AXIL_S_BEL)
    input  wire [9:0]  slv_awaddr,
    input  wire        slv_awvalid,
    output wire        slv_awready,
    input  wire [31:0] slv_wdata,
    input  wire [3:0]  slv_wstrb,
    input  wire        slv_wvalid,
    output wire        slv_wready,
    output wire [1:0]  slv_bresp,
    output wire        slv_bvalid,
    input  wire        slv_bready,
    input  wire [9:0]  slv_araddr,
    input  wire        slv_arvalid,
    output wire        slv_arready,
    output wire [31:0] slv_rdata,
    output wire [1:0]  slv_rresp,
    output wire        slv_rvalid,
    input  wire        slv_rready,

    // AXI4 full master FAB pins (AXI_M_BEL)
    output wire [31:0] mst_awaddr,
    output wire [7:0]  mst_awlen,
    output wire [2:0]  mst_awsize,
    output wire [1:0]  mst_awburst,
    output wire        mst_awvalid,
    input  wire        mst_awready,
    output wire [31:0] mst_wdata,
    output wire [3:0]  mst_wstrb,
    output wire        mst_wlast,
    output wire        mst_wvalid,
    input  wire        mst_wready,
    input  wire [1:0]  mst_bresp,
    input  wire        mst_bvalid,
    output wire        mst_bready,
    output wire [31:0] mst_araddr,
    output wire [7:0]  mst_arlen,
    output wire [2:0]  mst_arsize,
    output wire [1:0]  mst_arburst,
    output wire        mst_arvalid,
    input  wire        mst_arready,
    input  wire [31:0] mst_rdata,
    input  wire [1:0]  mst_rresp,
    input  wire        mst_rlast,
    input  wire        mst_rvalid,
    output wire        mst_rready
);

    wire rst = io_in[0];
    wire en  = io_in[1];

    reg [31:0] cnt;
    always @(posedge clk)
        if (en)
            if (rst) cnt <= 32'b0;
            else cnt <= cnt + 1'b1;
        else cnt <= cnt;

    assign io_out = {12'b0, cnt[15:0]};
    assign io_oeb = 28'b0000000000000000000000000001;

    // --- AXI4 full master: loopback inputs, counter on spare outputs ---
    assign mst_awaddr  = mst_rdata;              // loopback
    assign mst_awlen   = slv_awaddr[7:0];        // loopback
    assign mst_awsize  = {cnt[0], slv_awaddr[9:8]}; // [2]=counter, [1:0]=loopback
    assign mst_awburst = mst_bresp;              // loopback
    assign mst_awvalid = mst_awready;            // loopback
    assign mst_wdata   = cnt;                    // counter
    assign mst_wstrb   = slv_wstrb;              // loopback
    assign mst_wlast   = mst_rlast;              // loopback
    assign mst_wvalid  = mst_wready;             // loopback
    assign mst_bready  = mst_bvalid;             // loopback
    assign mst_araddr  = slv_wdata;              // loopback
    assign mst_arlen   = slv_araddr[7:0];        // loopback
    assign mst_arsize  = {cnt[1], slv_araddr[9:8]}; // [2]=counter, [1:0]=loopback
    assign mst_arburst = mst_rresp;              // loopback
    assign mst_arvalid = mst_arready;            // loopback
    assign mst_rready  = mst_rvalid;             // loopback

    // --- AXI4-Lite slave: loopback inputs, counter on spare outputs ---
    assign slv_awready = slv_awvalid;            // loopback
    assign slv_wready  = slv_wvalid;             // loopback
    assign slv_bresp   = cnt[1:0];               // counter
    assign slv_bvalid  = slv_bready;             // loopback
    assign slv_arready = slv_arvalid;            // loopback
    assign slv_rdata   = cnt;                    // counter
    assign slv_rresp   = cnt[3:2];               // counter
    assign slv_rvalid  = slv_rready;             // loopback

endmodule
`default_nettype wire
