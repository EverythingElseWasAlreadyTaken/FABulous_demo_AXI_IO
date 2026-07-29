`timescale 1ns / 1ps

module AXI4_LITE_SLAVE_BEL #(
    parameter int DATA_WIDTH = 32,
    parameter int FAB_ADDR_WIDTH = 10 // 1 KB Address Space inside Fabric
)(
    input  wire [FAB_ADDR_WIDTH-1:0] SOC_AWADDR,
    // input  wire [2:0]                SOC_AWPROT,
    input  wire                      SOC_AWVALID,
    output wire                      SOC_AWREADY,

    input  wire [DATA_WIDTH-1:0]     SOC_WDATA,
    input  wire [(DATA_WIDTH/8)-1:0] SOC_WSTRB,
    input  wire                      SOC_WVALID,
    output wire                      SOC_WREADY,

    output wire [1:0]                SOC_BRESP,
    output wire                      SOC_BVALID,
    input  wire                      SOC_BREADY,

    input  wire [FAB_ADDR_WIDTH-1:0] SOC_ARADDR,
    // input  wire [2:0]                SOC_ARPROT,
    input  wire                      SOC_ARVALID,
    output wire                      SOC_ARREADY,

    output wire [DATA_WIDTH-1:0]     SOC_RDATA,
    output wire [1:0]                SOC_RRESP,
    output wire                      SOC_RVALID,
    input  wire                      SOC_RREADY,

    output wire [FAB_ADDR_WIDTH-1:0] FAB_AWADDR,
    // output wire [2:0]             FAB_AWPROT,
    output wire                      FAB_AWVALID,
    input  wire                      FAB_AWREADY,

    output wire [DATA_WIDTH-1:0]     FAB_WDATA,
    output wire [(DATA_WIDTH/8)-1:0] FAB_WSTRB,
    output wire                      FAB_WVALID,
    input  wire                      FAB_WREADY,

    input  wire [1:0]                FAB_BRESP,
    input  wire                      FAB_BVALID,
    output wire                      FAB_BREADY,

    output wire [FAB_ADDR_WIDTH-1:0] FAB_ARADDR,
    // output wire [2:0]             FAB_ARPROT,
    output wire                      FAB_ARVALID,
    input  wire                      FAB_ARREADY,

    input  wire [DATA_WIDTH-1:0]     FAB_RDATA,
    input  wire [1:0]                FAB_RRESP,
    input  wire                      FAB_RVALID,
    output wire                      FAB_RREADY
);

    // ==========================================
    // SOC -> FABRIC
    // ==========================================
    assign FAB_AWADDR  = SOC_AWADDR;
    // assign FAB_AWPROT  = SOC_AWPROT;
    assign FAB_AWVALID = SOC_AWVALID;
    assign FAB_WDATA   = SOC_WDATA;
    assign FAB_WSTRB   = SOC_WSTRB;
    assign FAB_WVALID  = SOC_WVALID;
    assign FAB_BREADY  = SOC_BREADY;
    assign FAB_ARADDR  = SOC_ARADDR;
    // assign FAB_ARPROT  = SOC_ARPROT;
    assign FAB_ARVALID = SOC_ARVALID;
    assign FAB_RREADY  = SOC_RREADY;

    // ==========================================
    // FABRIC -> SOC
    // ==========================================
    assign SOC_AWREADY = FAB_AWREADY;
    assign SOC_WREADY  = FAB_WREADY;

    assign SOC_BRESP   = FAB_BRESP;
    assign SOC_BVALID  = FAB_BVALID;

    assign SOC_ARREADY = FAB_ARREADY;
    assign SOC_RDATA   = FAB_RDATA;

    assign SOC_RRESP   = FAB_RRESP;
    assign SOC_RVALID  = FAB_RVALID;

endmodule
