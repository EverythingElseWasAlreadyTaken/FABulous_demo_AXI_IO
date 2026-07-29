`timescale 1ns / 1ps

module AXI4_FULL_MASTER_BEL #(
    parameter int DATA_WIDTH = 32,
    parameter int ADDR_WIDTH = 32
    // parameter int ID_WIDTH   = 8
)(
    // ==========================================
    // SOC FACING PINS (Connect to Connector/Shim)
    // ==========================================
    // output wire [ID_WIDTH-1:0]       SOC_AWID,
    output wire [ADDR_WIDTH-1:0]     SOC_AWADDR,
    output wire [7:0]                SOC_AWLEN,
    output wire [2:0]                SOC_AWSIZE,
    output wire [1:0]                SOC_AWBURST,
    // output wire                      SOC_AWLOCK,
    // output wire [3:0]                SOC_AWCACHE,
    // output wire [2:0]                SOC_AWPROT,
    // output wire [3:0]                SOC_AWQOS,
    // output wire [3:0]                SOC_AWREGION,
    output wire                      SOC_AWVALID,
    input  wire                      SOC_AWREADY,

    output wire [DATA_WIDTH-1:0]     SOC_WDATA,
    output wire [(DATA_WIDTH/8)-1:0] SOC_WSTRB,
    output wire                      SOC_WLAST,
    output wire                      SOC_WVALID,
    input  wire                      SOC_WREADY,

    // input  wire [ID_WIDTH-1:0]       SOC_BID,
    input  wire [1:0]                SOC_BRESP,
    input  wire                      SOC_BVALID,
    output wire                      SOC_BREADY,

    // output wire [ID_WIDTH-1:0]       SOC_ARID,
    output wire [ADDR_WIDTH-1:0]     SOC_ARADDR,
    output wire [7:0]                SOC_ARLEN,
    output wire [2:0]                SOC_ARSIZE,
    output wire [1:0]                SOC_ARBURST,
    // output wire                      SOC_ARLOCK,
    // output wire [3:0]                SOC_ARCACHE,
    // output wire [2:0]                SOC_ARPROT,
    // output wire [3:0]                SOC_ARQOS,
    // output wire [3:0]                SOC_ARREGION,
    output wire                      SOC_ARVALID,
    input  wire                      SOC_ARREADY,

    // input  wire [ID_WIDTH-1:0]       SOC_RID,
    input  wire [DATA_WIDTH-1:0]     SOC_RDATA,
    input  wire [1:0]                SOC_RRESP,
    input  wire                      SOC_RLAST,
    input  wire                      SOC_RVALID,
    output wire                      SOC_RREADY,

    // ==========================================
    // FABRIC FACING PINS (Routed by FABulous)
    // ==========================================
    // input  wire [ID_WIDTH-1:0]    FAB_AWID,
    input  wire [ADDR_WIDTH-1:0]     FAB_AWADDR,
    input  wire [7:0]                FAB_AWLEN,
    input  wire [2:0]                FAB_AWSIZE,
    input  wire [1:0]                FAB_AWBURST,
    // input  wire                   FAB_AWLOCK,
    // input  wire [3:0]             FAB_AWCACHE,
    // input  wire [2:0]             FAB_AWPROT,
    // input  wire [3:0]             FAB_AWQOS,
    // input  wire [3:0]             FAB_AWREGION,
    input  wire                      FAB_AWVALID,
    output wire                      FAB_AWREADY,

    input  wire [DATA_WIDTH-1:0]     FAB_WDATA,
    input  wire [(DATA_WIDTH/8)-1:0] FAB_WSTRB,
    input  wire                      FAB_WLAST,
    input  wire                      FAB_WVALID,
    output wire                      FAB_WREADY,

    // output wire [ID_WIDTH-1:0]    FAB_BID,
    output wire [1:0]                FAB_BRESP,
    output wire                      FAB_BVALID,
    input  wire                      FAB_BREADY,

    // input  wire [ID_WIDTH-1:0]    FAB_ARID,
    input  wire [ADDR_WIDTH-1:0]     FAB_ARADDR,
    input  wire [7:0]                FAB_ARLEN,
    input  wire [2:0]                FAB_ARSIZE,
    input  wire [1:0]                FAB_ARBURST,
    // input  wire                   FAB_ARLOCK,
    // input  wire [3:0]             FAB_ARCACHE,
    // input  wire [2:0]             FAB_ARPROT,
    // input  wire [3:0]             FAB_ARQOS,
    // input  wire [3:0]             FAB_ARREGION,
    input  wire                      FAB_ARVALID,
    output wire                      FAB_ARREADY,

    // output wire [ID_WIDTH-1:0]    FAB_RID,
    output wire [DATA_WIDTH-1:0]     FAB_RDATA,
    output wire [1:0]                FAB_RRESP,
    output wire                      FAB_RLAST,
    output wire                      FAB_RVALID,
    input  wire                      FAB_RREADY
);

    // ==========================================
    // FABRIC -> SOC
    // ==========================================
    // assign SOC_AWID     = FAB_AWID;
    // assign SOC_AWLOCK   = FAB_AWLOCK;
    // assign SOC_AWCACHE  = FAB_AWCACHE;
    // assign SOC_AWPROT   = FAB_AWPROT;
    // assign SOC_AWQOS    = FAB_AWQOS;
    // assign SOC_AWREGION = FAB_AWREGION;
    
    assign SOC_AWADDR  = FAB_AWADDR;
    // CFG_TIE_OFF_CANDIDATE: Config to 8'd0 for AXI-Lite Masters (1-beat burst)
    assign SOC_AWLEN   = FAB_AWLEN;
    // CFG_TIE_OFF_CANDIDATE: Config to 3'b010 (4 Bytes) to save routing
    assign SOC_AWSIZE  = FAB_AWSIZE;
    // CFG_TIE_OFF_CANDIDATE: Config to 2'b01 (INCR) to save routing
    assign SOC_AWBURST = FAB_AWBURST;
    assign SOC_AWVALID = FAB_AWVALID;

    assign SOC_WDATA   = FAB_WDATA;
    // CFG_TIE_OFF_CANDIDATE: Config to 4'b1111 if master always writes full 32-bit words
    assign SOC_WSTRB   = FAB_WSTRB;
    // CFG_TIE_OFF_CANDIDATE: Config to 1'b1 for AXI-Lite Masters (every beat is the last beat)
    assign SOC_WLAST   = FAB_WLAST;
    assign SOC_WVALID  = FAB_WVALID;

    assign SOC_BREADY  = FAB_BREADY;

    // assign SOC_ARID     = FAB_ARID;
    // assign SOC_ARLOCK   = FAB_ARLOCK;
    // assign SOC_ARCACHE  = FAB_ARCACHE;
    // assign SOC_ARPROT   = FAB_ARPROT;
    // assign SOC_ARQOS    = FAB_ARQOS;
    // assign SOC_ARREGION = FAB_ARREGION;

    assign SOC_ARADDR  = FAB_ARADDR;
    // CFG_TIE_OFF_CANDIDATE: Config to 8'd0 for AXI-Lite Masters (1-beat burst)
    assign SOC_ARLEN   = FAB_ARLEN;
    // CFG_TIE_OFF_CANDIDATE: Config to 3'b010 (4 Bytes) to save routing
    assign SOC_ARSIZE  = FAB_ARSIZE;
    // CFG_TIE_OFF_CANDIDATE: Config to 2'b01 (INCR) to save routing
    assign SOC_ARBURST = FAB_ARBURST;
    assign SOC_ARVALID = FAB_ARVALID;

    assign SOC_RREADY  = FAB_RREADY;

    // ==========================================
    // SOC -> FABRIC
    // ==========================================
    assign FAB_AWREADY = SOC_AWREADY;
    assign FAB_WREADY  = SOC_WREADY;
    
    // assign FAB_BID      = SOC_BID;
    assign FAB_BRESP   = SOC_BRESP;
    assign FAB_BVALID  = SOC_BVALID;
    
    assign FAB_ARREADY = SOC_ARREADY;
    
    // assign FAB_RID      = SOC_RID;
    assign FAB_RDATA   = SOC_RDATA;
    assign FAB_RRESP   = SOC_RRESP;
    assign FAB_RLAST   = SOC_RLAST;
    assign FAB_RVALID  = SOC_RVALID;

endmodule
