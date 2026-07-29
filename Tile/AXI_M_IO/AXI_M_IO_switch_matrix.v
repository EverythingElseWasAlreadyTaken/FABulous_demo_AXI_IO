 // NumberOfConfigBits: 0
module AXI_M_IO_switch_matrix
    (
 //SJUMP inputs from child tiles
        input  AXI_M_IO_5_BASE_TO_TOP0,
        input  AXI_M_IO_5_BASE_TO_TOP1,
        input  AXI_M_IO_5_BASE_TO_TOP2,
        input  AXI_M_IO_5_BASE_TO_TOP3,
        input  AXI_M_IO_5_BASE_TO_TOP4,
        input  AXI_M_IO_5_BASE_TO_TOP5,
        input  AXI_M_IO_5_BASE_TO_TOP6,
        input  AXI_M_IO_5_BASE_TO_TOP7,
        input  AXI_M_IO_5_BASE_TO_TOP8,
        input  AXI_M_IO_5_BASE_TO_TOP9,
        input  AXI_M_IO_5_BASE_TO_TOP10,
        input  AXI_M_IO_5_BASE_TO_TOP11,
        input  AXI_M_IO_5_BASE_TO_TOP12,
        input  AXI_M_IO_5_BASE_TO_TOP13,
        input  AXI_M_IO_5_BASE_TO_TOP14,
        input  AXI_M_IO_5_BASE_TO_TOP15,
        input  AXI_M_IO_5_BASE_TO_TOP16,
        input  AXI_M_IO_5_BASE_TO_TOP17,
        input  AXI_M_IO_5_BASE_TO_TOP18,
        input  AXI_M_IO_5_BASE_TO_TOP19,
        input  AXI_M_IO_5_BASE_TO_TOP20,
        input  AXI_M_IO_5_BASE_TO_TOP21,
        input  AXI_M_IO_5_BASE_TO_TOP22,
        input  AXI_M_IO_5_BASE_TO_TOP23,
        input  AXI_M_IO_4_BASE_TO_TOP0,
        input  AXI_M_IO_4_BASE_TO_TOP1,
        input  AXI_M_IO_4_BASE_TO_TOP2,
        input  AXI_M_IO_4_BASE_TO_TOP3,
        input  AXI_M_IO_4_BASE_TO_TOP4,
        input  AXI_M_IO_4_BASE_TO_TOP5,
        input  AXI_M_IO_4_BASE_TO_TOP6,
        input  AXI_M_IO_4_BASE_TO_TOP7,
        input  AXI_M_IO_4_BASE_TO_TOP8,
        input  AXI_M_IO_4_BASE_TO_TOP9,
        input  AXI_M_IO_4_BASE_TO_TOP10,
        input  AXI_M_IO_4_BASE_TO_TOP11,
        input  AXI_M_IO_4_BASE_TO_TOP12,
        input  AXI_M_IO_4_BASE_TO_TOP13,
        input  AXI_M_IO_4_BASE_TO_TOP14,
        input  AXI_M_IO_4_BASE_TO_TOP15,
        input  AXI_M_IO_4_BASE_TO_TOP16,
        input  AXI_M_IO_4_BASE_TO_TOP17,
        input  AXI_M_IO_4_BASE_TO_TOP18,
        input  AXI_M_IO_4_BASE_TO_TOP19,
        input  AXI_M_IO_4_BASE_TO_TOP20,
        input  AXI_M_IO_4_BASE_TO_TOP21,
        input  AXI_M_IO_4_BASE_TO_TOP22,
        input  AXI_M_IO_4_BASE_TO_TOP23,
        input  AXI_M_IO_3_BASE_TO_TOP0,
        input  AXI_M_IO_3_BASE_TO_TOP1,
        input  AXI_M_IO_3_BASE_TO_TOP2,
        input  AXI_M_IO_3_BASE_TO_TOP3,
        input  AXI_M_IO_3_BASE_TO_TOP4,
        input  AXI_M_IO_3_BASE_TO_TOP5,
        input  AXI_M_IO_3_BASE_TO_TOP6,
        input  AXI_M_IO_3_BASE_TO_TOP7,
        input  AXI_M_IO_3_BASE_TO_TOP8,
        input  AXI_M_IO_3_BASE_TO_TOP9,
        input  AXI_M_IO_3_BASE_TO_TOP10,
        input  AXI_M_IO_3_BASE_TO_TOP11,
        input  AXI_M_IO_3_BASE_TO_TOP12,
        input  AXI_M_IO_3_BASE_TO_TOP13,
        input  AXI_M_IO_3_BASE_TO_TOP14,
        input  AXI_M_IO_3_BASE_TO_TOP15,
        input  AXI_M_IO_3_BASE_TO_TOP16,
        input  AXI_M_IO_3_BASE_TO_TOP17,
        input  AXI_M_IO_3_BASE_TO_TOP18,
        input  AXI_M_IO_3_BASE_TO_TOP19,
        input  AXI_M_IO_3_BASE_TO_TOP20,
        input  AXI_M_IO_3_BASE_TO_TOP21,
        input  AXI_M_IO_3_BASE_TO_TOP22,
        input  AXI_M_IO_3_BASE_TO_TOP23,
        input  AXI_M_IO_2_BASE_TO_TOP0,
        input  AXI_M_IO_2_BASE_TO_TOP1,
        input  AXI_M_IO_2_BASE_TO_TOP2,
        input  AXI_M_IO_2_BASE_TO_TOP3,
        input  AXI_M_IO_2_BASE_TO_TOP4,
        input  AXI_M_IO_2_BASE_TO_TOP5,
        input  AXI_M_IO_2_BASE_TO_TOP6,
        input  AXI_M_IO_2_BASE_TO_TOP7,
        input  AXI_M_IO_2_BASE_TO_TOP8,
        input  AXI_M_IO_2_BASE_TO_TOP9,
        input  AXI_M_IO_2_BASE_TO_TOP10,
        input  AXI_M_IO_2_BASE_TO_TOP11,
        input  AXI_M_IO_2_BASE_TO_TOP12,
        input  AXI_M_IO_2_BASE_TO_TOP13,
        input  AXI_M_IO_2_BASE_TO_TOP14,
        input  AXI_M_IO_2_BASE_TO_TOP15,
        input  AXI_M_IO_2_BASE_TO_TOP16,
        input  AXI_M_IO_2_BASE_TO_TOP17,
        input  AXI_M_IO_2_BASE_TO_TOP18,
        input  AXI_M_IO_2_BASE_TO_TOP19,
        input  AXI_M_IO_2_BASE_TO_TOP20,
        input  AXI_M_IO_2_BASE_TO_TOP21,
        input  AXI_M_IO_2_BASE_TO_TOP22,
        input  AXI_M_IO_2_BASE_TO_TOP23,
        input  AXI_M_IO_1_BASE_TO_TOP0,
        input  AXI_M_IO_1_BASE_TO_TOP1,
        input  AXI_M_IO_1_BASE_TO_TOP2,
        input  AXI_M_IO_1_BASE_TO_TOP3,
        input  AXI_M_IO_1_BASE_TO_TOP4,
        input  AXI_M_IO_1_BASE_TO_TOP5,
        input  AXI_M_IO_1_BASE_TO_TOP6,
        input  AXI_M_IO_1_BASE_TO_TOP7,
        input  AXI_M_IO_1_BASE_TO_TOP8,
        input  AXI_M_IO_1_BASE_TO_TOP9,
        input  AXI_M_IO_1_BASE_TO_TOP10,
        input  AXI_M_IO_1_BASE_TO_TOP11,
        input  AXI_M_IO_1_BASE_TO_TOP12,
        input  AXI_M_IO_1_BASE_TO_TOP13,
        input  AXI_M_IO_1_BASE_TO_TOP14,
        input  AXI_M_IO_1_BASE_TO_TOP15,
        input  AXI_M_IO_1_BASE_TO_TOP16,
        input  AXI_M_IO_1_BASE_TO_TOP17,
        input  AXI_M_IO_1_BASE_TO_TOP18,
        input  AXI_M_IO_1_BASE_TO_TOP19,
        input  AXI_M_IO_1_BASE_TO_TOP20,
        input  AXI_M_IO_1_BASE_TO_TOP21,
        input  AXI_M_IO_1_BASE_TO_TOP22,
        input  AXI_M_IO_1_BASE_TO_TOP23,
        input  AXI_M_IO_0_BASE_TO_TOP0,
        input  AXI_M_IO_0_BASE_TO_TOP1,
        input  AXI_M_IO_0_BASE_TO_TOP2,
        input  AXI_M_IO_0_BASE_TO_TOP3,
        input  AXI_M_IO_0_BASE_TO_TOP4,
        input  AXI_M_IO_0_BASE_TO_TOP5,
        input  AXI_M_IO_0_BASE_TO_TOP6,
        input  AXI_M_IO_0_BASE_TO_TOP7,
        input  AXI_M_IO_0_BASE_TO_TOP8,
        input  AXI_M_IO_0_BASE_TO_TOP9,
        input  AXI_M_IO_0_BASE_TO_TOP10,
        input  AXI_M_IO_0_BASE_TO_TOP11,
        input  AXI_M_IO_0_BASE_TO_TOP12,
        input  AXI_M_IO_0_BASE_TO_TOP13,
        input  AXI_M_IO_0_BASE_TO_TOP14,
        input  AXI_M_IO_0_BASE_TO_TOP15,
        input  AXI_M_IO_0_BASE_TO_TOP16,
        input  AXI_M_IO_0_BASE_TO_TOP17,
        input  AXI_M_IO_0_BASE_TO_TOP18,
        input  AXI_M_IO_0_BASE_TO_TOP19,
        input  AXI_M_IO_0_BASE_TO_TOP20,
        input  AXI_M_IO_0_BASE_TO_TOP21,
        input  AXI_M_IO_0_BASE_TO_TOP22,
        input  AXI_M_IO_0_BASE_TO_TOP23,
 //BEL input ports (SM outputs)
        output  FAB_AWADDR0,
        output  FAB_AWADDR1,
        output  FAB_AWADDR2,
        output  FAB_AWADDR3,
        output  FAB_AWADDR4,
        output  FAB_AWADDR5,
        output  FAB_AWADDR6,
        output  FAB_AWADDR7,
        output  FAB_AWADDR8,
        output  FAB_AWADDR9,
        output  FAB_AWADDR10,
        output  FAB_AWADDR11,
        output  FAB_AWADDR12,
        output  FAB_AWADDR13,
        output  FAB_AWADDR14,
        output  FAB_AWADDR15,
        output  FAB_AWADDR16,
        output  FAB_AWADDR17,
        output  FAB_AWADDR18,
        output  FAB_AWADDR19,
        output  FAB_AWADDR20,
        output  FAB_AWADDR21,
        output  FAB_AWADDR22,
        output  FAB_AWADDR23,
        output  FAB_AWADDR24,
        output  FAB_AWADDR25,
        output  FAB_AWADDR26,
        output  FAB_AWADDR27,
        output  FAB_AWADDR28,
        output  FAB_AWADDR29,
        output  FAB_AWADDR30,
        output  FAB_AWADDR31,
        output  FAB_AWLEN0,
        output  FAB_AWLEN1,
        output  FAB_AWLEN2,
        output  FAB_AWLEN3,
        output  FAB_AWLEN4,
        output  FAB_AWLEN5,
        output  FAB_AWLEN6,
        output  FAB_AWLEN7,
        output  FAB_AWSIZE0,
        output  FAB_AWSIZE1,
        output  FAB_AWSIZE2,
        output  FAB_AWBURST0,
        output  FAB_AWBURST1,
        output  FAB_AWVALID,
        output  FAB_WDATA0,
        output  FAB_WDATA1,
        output  FAB_WDATA2,
        output  FAB_WDATA3,
        output  FAB_WDATA4,
        output  FAB_WDATA5,
        output  FAB_WDATA6,
        output  FAB_WDATA7,
        output  FAB_WDATA8,
        output  FAB_WDATA9,
        output  FAB_WDATA10,
        output  FAB_WDATA11,
        output  FAB_WDATA12,
        output  FAB_WDATA13,
        output  FAB_WDATA14,
        output  FAB_WDATA15,
        output  FAB_WDATA16,
        output  FAB_WDATA17,
        output  FAB_WDATA18,
        output  FAB_WDATA19,
        output  FAB_WDATA20,
        output  FAB_WDATA21,
        output  FAB_WDATA22,
        output  FAB_WDATA23,
        output  FAB_WDATA24,
        output  FAB_WDATA25,
        output  FAB_WDATA26,
        output  FAB_WDATA27,
        output  FAB_WDATA28,
        output  FAB_WDATA29,
        output  FAB_WDATA30,
        output  FAB_WDATA31,
        output  FAB_WSTRB0,
        output  FAB_WSTRB1,
        output  FAB_WSTRB2,
        output  FAB_WSTRB3,
        output  FAB_WLAST,
        output  FAB_WVALID,
        output  FAB_BREADY,
        output  FAB_ARADDR0,
        output  FAB_ARADDR1,
        output  FAB_ARADDR2,
        output  FAB_ARADDR3,
        output  FAB_ARADDR4,
        output  FAB_ARADDR5,
        output  FAB_ARADDR6,
        output  FAB_ARADDR7,
        output  FAB_ARADDR8,
        output  FAB_ARADDR9,
        output  FAB_ARADDR10,
        output  FAB_ARADDR11,
        output  FAB_ARADDR12,
        output  FAB_ARADDR13,
        output  FAB_ARADDR14,
        output  FAB_ARADDR15,
        output  FAB_ARADDR16,
        output  FAB_ARADDR17,
        output  FAB_ARADDR18,
        output  FAB_ARADDR19,
        output  FAB_ARADDR20,
        output  FAB_ARADDR21,
        output  FAB_ARADDR22,
        output  FAB_ARADDR23,
        output  FAB_ARADDR24,
        output  FAB_ARADDR25,
        output  FAB_ARADDR26,
        output  FAB_ARADDR27,
        output  FAB_ARADDR28,
        output  FAB_ARADDR29,
        output  FAB_ARADDR30,
        output  FAB_ARADDR31,
        output  FAB_ARLEN0,
        output  FAB_ARLEN1,
        output  FAB_ARLEN2,
        output  FAB_ARLEN3,
        output  FAB_ARLEN4,
        output  FAB_ARLEN5,
        output  FAB_ARLEN6,
        output  FAB_ARLEN7,
        output  FAB_ARSIZE0,
        output  FAB_ARSIZE1,
        output  FAB_ARSIZE2,
        output  FAB_ARBURST0,
        output  FAB_ARBURST1,
        output  FAB_ARVALID,
        output  FAB_RREADY,
 //BEL output ports (SM inputs)
        input  FAB_AWREADY,
        input  FAB_WREADY,
        input  FAB_BRESP0,
        input  FAB_BRESP1,
        input  FAB_BVALID,
        input  FAB_ARREADY,
        input  FAB_RDATA0,
        input  FAB_RDATA1,
        input  FAB_RDATA2,
        input  FAB_RDATA3,
        input  FAB_RDATA4,
        input  FAB_RDATA5,
        input  FAB_RDATA6,
        input  FAB_RDATA7,
        input  FAB_RDATA8,
        input  FAB_RDATA9,
        input  FAB_RDATA10,
        input  FAB_RDATA11,
        input  FAB_RDATA12,
        input  FAB_RDATA13,
        input  FAB_RDATA14,
        input  FAB_RDATA15,
        input  FAB_RDATA16,
        input  FAB_RDATA17,
        input  FAB_RDATA18,
        input  FAB_RDATA19,
        input  FAB_RDATA20,
        input  FAB_RDATA21,
        input  FAB_RDATA22,
        input  FAB_RDATA23,
        input  FAB_RDATA24,
        input  FAB_RDATA25,
        input  FAB_RDATA26,
        input  FAB_RDATA27,
        input  FAB_RDATA28,
        input  FAB_RDATA29,
        input  FAB_RDATA30,
        input  FAB_RDATA31,
        input  FAB_RRESP0,
        input  FAB_RRESP1,
        input  FAB_RLAST,
        input  FAB_RVALID,
 //Reverse SJUMP outputs (SM -> child tile)
        output  AXI_M_IO_5_TOP_TO_BASE0,
        output  AXI_M_IO_5_TOP_TO_BASE1,
        output  AXI_M_IO_5_TOP_TO_BASE2,
        output  AXI_M_IO_5_TOP_TO_BASE3,
        output  AXI_M_IO_5_TOP_TO_BASE4,
        output  AXI_M_IO_5_TOP_TO_BASE5,
        output  AXI_M_IO_5_TOP_TO_BASE6,
        output  AXI_M_IO_5_TOP_TO_BASE7,
        output  AXI_M_IO_4_TOP_TO_BASE0,
        output  AXI_M_IO_4_TOP_TO_BASE1,
        output  AXI_M_IO_4_TOP_TO_BASE2,
        output  AXI_M_IO_4_TOP_TO_BASE3,
        output  AXI_M_IO_4_TOP_TO_BASE4,
        output  AXI_M_IO_4_TOP_TO_BASE5,
        output  AXI_M_IO_4_TOP_TO_BASE6,
        output  AXI_M_IO_4_TOP_TO_BASE7,
        output  AXI_M_IO_3_TOP_TO_BASE0,
        output  AXI_M_IO_3_TOP_TO_BASE1,
        output  AXI_M_IO_3_TOP_TO_BASE2,
        output  AXI_M_IO_3_TOP_TO_BASE3,
        output  AXI_M_IO_3_TOP_TO_BASE4,
        output  AXI_M_IO_3_TOP_TO_BASE5,
        output  AXI_M_IO_3_TOP_TO_BASE6,
        output  AXI_M_IO_3_TOP_TO_BASE7,
        output  AXI_M_IO_2_TOP_TO_BASE0,
        output  AXI_M_IO_2_TOP_TO_BASE1,
        output  AXI_M_IO_2_TOP_TO_BASE2,
        output  AXI_M_IO_2_TOP_TO_BASE3,
        output  AXI_M_IO_2_TOP_TO_BASE4,
        output  AXI_M_IO_2_TOP_TO_BASE5,
        output  AXI_M_IO_2_TOP_TO_BASE6,
        output  AXI_M_IO_2_TOP_TO_BASE7,
        output  AXI_M_IO_1_TOP_TO_BASE0,
        output  AXI_M_IO_1_TOP_TO_BASE1,
        output  AXI_M_IO_1_TOP_TO_BASE2,
        output  AXI_M_IO_1_TOP_TO_BASE3,
        output  AXI_M_IO_1_TOP_TO_BASE4,
        output  AXI_M_IO_1_TOP_TO_BASE5,
        output  AXI_M_IO_1_TOP_TO_BASE6,
        output  AXI_M_IO_1_TOP_TO_BASE7,
        output  AXI_M_IO_0_TOP_TO_BASE0,
        output  AXI_M_IO_0_TOP_TO_BASE1,
        output  AXI_M_IO_0_TOP_TO_BASE2,
        output  AXI_M_IO_0_TOP_TO_BASE3,
        output  AXI_M_IO_0_TOP_TO_BASE4,
        output  AXI_M_IO_0_TOP_TO_BASE5,
        output  AXI_M_IO_0_TOP_TO_BASE6,
        output  AXI_M_IO_0_TOP_TO_BASE7
 //global
);
parameter GND0 = 1'b0;
parameter GND = 1'b0;
parameter VCC0 = 1'b1;
parameter VCC = 1'b1;
parameter VDD0 = 1'b1;
parameter VDD = 1'b1;

 //The configuration bits (if any) are just a long shift register
 //This shift register is padded to an even number of flops/latches
 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE7 = FAB_AWREADY;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE6 = FAB_WREADY;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE5 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE5 = FAB_BRESP1;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE4 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE4 = FAB_BRESP0;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE3 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE3 = FAB_BVALID;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE2 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE2 = FAB_ARREADY;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE1 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE1 = FAB_RDATA31;

 //switch matrix multiplexer AXI_M_IO_5_TOP_TO_BASE0 MUX-1
assign AXI_M_IO_5_TOP_TO_BASE0 = FAB_RDATA30;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE7 = FAB_RDATA29;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE6 = FAB_RDATA28;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE5 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE5 = FAB_RDATA27;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE4 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE4 = FAB_RDATA26;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE3 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE3 = FAB_RDATA25;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE2 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE2 = FAB_RDATA24;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE1 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE1 = FAB_RDATA23;

 //switch matrix multiplexer AXI_M_IO_4_TOP_TO_BASE0 MUX-1
assign AXI_M_IO_4_TOP_TO_BASE0 = FAB_RDATA22;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE7 = FAB_RDATA21;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE6 = FAB_RDATA20;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE5 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE5 = FAB_RDATA19;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE4 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE4 = FAB_RDATA18;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE3 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE3 = FAB_RDATA17;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE2 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE2 = FAB_RDATA16;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE1 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE1 = FAB_RDATA15;

 //switch matrix multiplexer AXI_M_IO_3_TOP_TO_BASE0 MUX-1
assign AXI_M_IO_3_TOP_TO_BASE0 = FAB_RDATA14;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE7 = FAB_RDATA13;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE6 = FAB_RDATA12;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE5 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE5 = FAB_RDATA11;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE4 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE4 = FAB_RDATA10;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE3 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE3 = FAB_RDATA9;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE2 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE2 = FAB_RDATA8;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE1 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE1 = FAB_RDATA7;

 //switch matrix multiplexer AXI_M_IO_2_TOP_TO_BASE0 MUX-1
assign AXI_M_IO_2_TOP_TO_BASE0 = FAB_RDATA6;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE7 = FAB_RDATA5;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE6 = FAB_RDATA4;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE5 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE5 = FAB_RDATA3;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE4 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE4 = FAB_RDATA2;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE3 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE3 = FAB_RDATA1;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE2 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE2 = FAB_RDATA0;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE1 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE1 = FAB_RRESP1;

 //switch matrix multiplexer AXI_M_IO_1_TOP_TO_BASE0 MUX-1
assign AXI_M_IO_1_TOP_TO_BASE0 = FAB_RRESP0;

 //switch matrix multiplexer AXI_M_IO_0_TOP_TO_BASE7 MUX-1
assign AXI_M_IO_0_TOP_TO_BASE7 = FAB_RLAST;

 //switch matrix multiplexer AXI_M_IO_0_TOP_TO_BASE6 MUX-1
assign AXI_M_IO_0_TOP_TO_BASE6 = FAB_RVALID;

 //switch matrix multiplexer FAB_AWADDR31 MUX-1
assign FAB_AWADDR31 = AXI_M_IO_5_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_AWADDR30 MUX-1
assign FAB_AWADDR30 = AXI_M_IO_5_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_AWADDR29 MUX-1
assign FAB_AWADDR29 = AXI_M_IO_5_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_AWADDR28 MUX-1
assign FAB_AWADDR28 = AXI_M_IO_5_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_AWADDR27 MUX-1
assign FAB_AWADDR27 = AXI_M_IO_5_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_AWADDR26 MUX-1
assign FAB_AWADDR26 = AXI_M_IO_5_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_AWADDR25 MUX-1
assign FAB_AWADDR25 = AXI_M_IO_5_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_AWADDR24 MUX-1
assign FAB_AWADDR24 = AXI_M_IO_5_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_AWADDR23 MUX-1
assign FAB_AWADDR23 = AXI_M_IO_5_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_AWADDR22 MUX-1
assign FAB_AWADDR22 = AXI_M_IO_5_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_AWADDR21 MUX-1
assign FAB_AWADDR21 = AXI_M_IO_5_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_AWADDR20 MUX-1
assign FAB_AWADDR20 = AXI_M_IO_5_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_AWADDR19 MUX-1
assign FAB_AWADDR19 = AXI_M_IO_5_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_AWADDR18 MUX-1
assign FAB_AWADDR18 = AXI_M_IO_5_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_AWADDR17 MUX-1
assign FAB_AWADDR17 = AXI_M_IO_5_BASE_TO_TOP9;

 //switch matrix multiplexer FAB_AWADDR16 MUX-1
assign FAB_AWADDR16 = AXI_M_IO_5_BASE_TO_TOP8;

 //switch matrix multiplexer FAB_AWADDR15 MUX-1
assign FAB_AWADDR15 = AXI_M_IO_5_BASE_TO_TOP7;

 //switch matrix multiplexer FAB_AWADDR14 MUX-1
assign FAB_AWADDR14 = AXI_M_IO_5_BASE_TO_TOP6;

 //switch matrix multiplexer FAB_AWADDR13 MUX-1
assign FAB_AWADDR13 = AXI_M_IO_5_BASE_TO_TOP5;

 //switch matrix multiplexer FAB_AWADDR12 MUX-1
assign FAB_AWADDR12 = AXI_M_IO_5_BASE_TO_TOP4;

 //switch matrix multiplexer FAB_AWADDR11 MUX-1
assign FAB_AWADDR11 = AXI_M_IO_5_BASE_TO_TOP3;

 //switch matrix multiplexer FAB_AWADDR10 MUX-1
assign FAB_AWADDR10 = AXI_M_IO_5_BASE_TO_TOP2;

 //switch matrix multiplexer FAB_AWADDR9 MUX-1
assign FAB_AWADDR9 = AXI_M_IO_5_BASE_TO_TOP1;

 //switch matrix multiplexer FAB_AWADDR8 MUX-1
assign FAB_AWADDR8 = AXI_M_IO_5_BASE_TO_TOP0;

 //switch matrix multiplexer FAB_AWADDR7 MUX-1
assign FAB_AWADDR7 = AXI_M_IO_4_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_AWADDR6 MUX-1
assign FAB_AWADDR6 = AXI_M_IO_4_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_AWADDR5 MUX-1
assign FAB_AWADDR5 = AXI_M_IO_4_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_AWADDR4 MUX-1
assign FAB_AWADDR4 = AXI_M_IO_4_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_AWADDR3 MUX-1
assign FAB_AWADDR3 = AXI_M_IO_4_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_AWADDR2 MUX-1
assign FAB_AWADDR2 = AXI_M_IO_4_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_AWADDR1 MUX-1
assign FAB_AWADDR1 = AXI_M_IO_4_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_AWADDR0 MUX-1
assign FAB_AWADDR0 = AXI_M_IO_4_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_AWLEN7 MUX-1
assign FAB_AWLEN7 = AXI_M_IO_4_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_AWLEN6 MUX-1
assign FAB_AWLEN6 = AXI_M_IO_4_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_AWLEN5 MUX-1
assign FAB_AWLEN5 = AXI_M_IO_4_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_AWLEN4 MUX-1
assign FAB_AWLEN4 = AXI_M_IO_4_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_AWLEN3 MUX-1
assign FAB_AWLEN3 = AXI_M_IO_4_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_AWLEN2 MUX-1
assign FAB_AWLEN2 = AXI_M_IO_4_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_AWLEN1 MUX-1
assign FAB_AWLEN1 = AXI_M_IO_4_BASE_TO_TOP9;

 //switch matrix multiplexer FAB_AWLEN0 MUX-1
assign FAB_AWLEN0 = AXI_M_IO_4_BASE_TO_TOP8;

 //switch matrix multiplexer FAB_AWSIZE2 MUX-1
assign FAB_AWSIZE2 = AXI_M_IO_4_BASE_TO_TOP7;

 //switch matrix multiplexer FAB_AWSIZE1 MUX-1
assign FAB_AWSIZE1 = AXI_M_IO_4_BASE_TO_TOP6;

 //switch matrix multiplexer FAB_AWSIZE0 MUX-1
assign FAB_AWSIZE0 = AXI_M_IO_4_BASE_TO_TOP5;

 //switch matrix multiplexer FAB_AWBURST1 MUX-1
assign FAB_AWBURST1 = AXI_M_IO_4_BASE_TO_TOP4;

 //switch matrix multiplexer FAB_AWBURST0 MUX-1
assign FAB_AWBURST0 = AXI_M_IO_4_BASE_TO_TOP3;

 //switch matrix multiplexer FAB_AWVALID MUX-1
assign FAB_AWVALID = AXI_M_IO_4_BASE_TO_TOP2;

 //switch matrix multiplexer FAB_WDATA31 MUX-1
assign FAB_WDATA31 = AXI_M_IO_3_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_WDATA30 MUX-1
assign FAB_WDATA30 = AXI_M_IO_3_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_WDATA29 MUX-1
assign FAB_WDATA29 = AXI_M_IO_3_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_WDATA28 MUX-1
assign FAB_WDATA28 = AXI_M_IO_3_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_WDATA27 MUX-1
assign FAB_WDATA27 = AXI_M_IO_3_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_WDATA26 MUX-1
assign FAB_WDATA26 = AXI_M_IO_3_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_WDATA25 MUX-1
assign FAB_WDATA25 = AXI_M_IO_3_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_WDATA24 MUX-1
assign FAB_WDATA24 = AXI_M_IO_3_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_WDATA23 MUX-1
assign FAB_WDATA23 = AXI_M_IO_3_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_WDATA22 MUX-1
assign FAB_WDATA22 = AXI_M_IO_3_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_WDATA21 MUX-1
assign FAB_WDATA21 = AXI_M_IO_3_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_WDATA20 MUX-1
assign FAB_WDATA20 = AXI_M_IO_3_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_WDATA19 MUX-1
assign FAB_WDATA19 = AXI_M_IO_3_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_WDATA18 MUX-1
assign FAB_WDATA18 = AXI_M_IO_3_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_WDATA17 MUX-1
assign FAB_WDATA17 = AXI_M_IO_3_BASE_TO_TOP9;

 //switch matrix multiplexer FAB_WDATA16 MUX-1
assign FAB_WDATA16 = AXI_M_IO_3_BASE_TO_TOP8;

 //switch matrix multiplexer FAB_WDATA15 MUX-1
assign FAB_WDATA15 = AXI_M_IO_3_BASE_TO_TOP7;

 //switch matrix multiplexer FAB_WDATA14 MUX-1
assign FAB_WDATA14 = AXI_M_IO_3_BASE_TO_TOP6;

 //switch matrix multiplexer FAB_WDATA13 MUX-1
assign FAB_WDATA13 = AXI_M_IO_3_BASE_TO_TOP5;

 //switch matrix multiplexer FAB_WDATA12 MUX-1
assign FAB_WDATA12 = AXI_M_IO_3_BASE_TO_TOP4;

 //switch matrix multiplexer FAB_WDATA11 MUX-1
assign FAB_WDATA11 = AXI_M_IO_3_BASE_TO_TOP3;

 //switch matrix multiplexer FAB_WDATA10 MUX-1
assign FAB_WDATA10 = AXI_M_IO_3_BASE_TO_TOP2;

 //switch matrix multiplexer FAB_WDATA9 MUX-1
assign FAB_WDATA9 = AXI_M_IO_3_BASE_TO_TOP1;

 //switch matrix multiplexer FAB_WDATA8 MUX-1
assign FAB_WDATA8 = AXI_M_IO_3_BASE_TO_TOP0;

 //switch matrix multiplexer FAB_WDATA7 MUX-1
assign FAB_WDATA7 = AXI_M_IO_2_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_WDATA6 MUX-1
assign FAB_WDATA6 = AXI_M_IO_2_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_WDATA5 MUX-1
assign FAB_WDATA5 = AXI_M_IO_2_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_WDATA4 MUX-1
assign FAB_WDATA4 = AXI_M_IO_2_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_WDATA3 MUX-1
assign FAB_WDATA3 = AXI_M_IO_2_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_WDATA2 MUX-1
assign FAB_WDATA2 = AXI_M_IO_2_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_WDATA1 MUX-1
assign FAB_WDATA1 = AXI_M_IO_2_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_WDATA0 MUX-1
assign FAB_WDATA0 = AXI_M_IO_2_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_WSTRB3 MUX-1
assign FAB_WSTRB3 = AXI_M_IO_2_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_WSTRB2 MUX-1
assign FAB_WSTRB2 = AXI_M_IO_2_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_WSTRB1 MUX-1
assign FAB_WSTRB1 = AXI_M_IO_2_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_WSTRB0 MUX-1
assign FAB_WSTRB0 = AXI_M_IO_2_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_WLAST MUX-1
assign FAB_WLAST = AXI_M_IO_2_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_WVALID MUX-1
assign FAB_WVALID = AXI_M_IO_2_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_BREADY MUX-1
assign FAB_BREADY = AXI_M_IO_2_BASE_TO_TOP9;

 //switch matrix multiplexer FAB_ARADDR31 MUX-1
assign FAB_ARADDR31 = AXI_M_IO_2_BASE_TO_TOP7;

 //switch matrix multiplexer FAB_ARADDR30 MUX-1
assign FAB_ARADDR30 = AXI_M_IO_2_BASE_TO_TOP6;

 //switch matrix multiplexer FAB_ARADDR29 MUX-1
assign FAB_ARADDR29 = AXI_M_IO_2_BASE_TO_TOP5;

 //switch matrix multiplexer FAB_ARADDR28 MUX-1
assign FAB_ARADDR28 = AXI_M_IO_2_BASE_TO_TOP4;

 //switch matrix multiplexer FAB_ARADDR27 MUX-1
assign FAB_ARADDR27 = AXI_M_IO_2_BASE_TO_TOP3;

 //switch matrix multiplexer FAB_ARADDR26 MUX-1
assign FAB_ARADDR26 = AXI_M_IO_2_BASE_TO_TOP2;

 //switch matrix multiplexer FAB_ARADDR25 MUX-1
assign FAB_ARADDR25 = AXI_M_IO_2_BASE_TO_TOP1;

 //switch matrix multiplexer FAB_ARADDR24 MUX-1
assign FAB_ARADDR24 = AXI_M_IO_2_BASE_TO_TOP0;

 //switch matrix multiplexer FAB_ARADDR23 MUX-1
assign FAB_ARADDR23 = AXI_M_IO_1_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_ARADDR22 MUX-1
assign FAB_ARADDR22 = AXI_M_IO_1_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_ARADDR21 MUX-1
assign FAB_ARADDR21 = AXI_M_IO_1_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_ARADDR20 MUX-1
assign FAB_ARADDR20 = AXI_M_IO_1_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_ARADDR19 MUX-1
assign FAB_ARADDR19 = AXI_M_IO_1_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_ARADDR18 MUX-1
assign FAB_ARADDR18 = AXI_M_IO_1_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_ARADDR17 MUX-1
assign FAB_ARADDR17 = AXI_M_IO_1_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_ARADDR16 MUX-1
assign FAB_ARADDR16 = AXI_M_IO_1_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_ARADDR15 MUX-1
assign FAB_ARADDR15 = AXI_M_IO_1_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_ARADDR14 MUX-1
assign FAB_ARADDR14 = AXI_M_IO_1_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_ARADDR13 MUX-1
assign FAB_ARADDR13 = AXI_M_IO_1_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_ARADDR12 MUX-1
assign FAB_ARADDR12 = AXI_M_IO_1_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_ARADDR11 MUX-1
assign FAB_ARADDR11 = AXI_M_IO_1_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_ARADDR10 MUX-1
assign FAB_ARADDR10 = AXI_M_IO_1_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_ARADDR9 MUX-1
assign FAB_ARADDR9 = AXI_M_IO_1_BASE_TO_TOP9;

 //switch matrix multiplexer FAB_ARADDR8 MUX-1
assign FAB_ARADDR8 = AXI_M_IO_1_BASE_TO_TOP8;

 //switch matrix multiplexer FAB_ARADDR7 MUX-1
assign FAB_ARADDR7 = AXI_M_IO_1_BASE_TO_TOP7;

 //switch matrix multiplexer FAB_ARADDR6 MUX-1
assign FAB_ARADDR6 = AXI_M_IO_1_BASE_TO_TOP6;

 //switch matrix multiplexer FAB_ARADDR5 MUX-1
assign FAB_ARADDR5 = AXI_M_IO_1_BASE_TO_TOP5;

 //switch matrix multiplexer FAB_ARADDR4 MUX-1
assign FAB_ARADDR4 = AXI_M_IO_1_BASE_TO_TOP4;

 //switch matrix multiplexer FAB_ARADDR3 MUX-1
assign FAB_ARADDR3 = AXI_M_IO_1_BASE_TO_TOP3;

 //switch matrix multiplexer FAB_ARADDR2 MUX-1
assign FAB_ARADDR2 = AXI_M_IO_1_BASE_TO_TOP2;

 //switch matrix multiplexer FAB_ARADDR1 MUX-1
assign FAB_ARADDR1 = AXI_M_IO_1_BASE_TO_TOP1;

 //switch matrix multiplexer FAB_ARADDR0 MUX-1
assign FAB_ARADDR0 = AXI_M_IO_1_BASE_TO_TOP0;

 //switch matrix multiplexer FAB_ARLEN7 MUX-1
assign FAB_ARLEN7 = AXI_M_IO_0_BASE_TO_TOP23;

 //switch matrix multiplexer FAB_ARLEN6 MUX-1
assign FAB_ARLEN6 = AXI_M_IO_0_BASE_TO_TOP22;

 //switch matrix multiplexer FAB_ARLEN5 MUX-1
assign FAB_ARLEN5 = AXI_M_IO_0_BASE_TO_TOP21;

 //switch matrix multiplexer FAB_ARLEN4 MUX-1
assign FAB_ARLEN4 = AXI_M_IO_0_BASE_TO_TOP20;

 //switch matrix multiplexer FAB_ARLEN3 MUX-1
assign FAB_ARLEN3 = AXI_M_IO_0_BASE_TO_TOP19;

 //switch matrix multiplexer FAB_ARLEN2 MUX-1
assign FAB_ARLEN2 = AXI_M_IO_0_BASE_TO_TOP18;

 //switch matrix multiplexer FAB_ARLEN1 MUX-1
assign FAB_ARLEN1 = AXI_M_IO_0_BASE_TO_TOP17;

 //switch matrix multiplexer FAB_ARLEN0 MUX-1
assign FAB_ARLEN0 = AXI_M_IO_0_BASE_TO_TOP16;

 //switch matrix multiplexer FAB_ARSIZE2 MUX-1
assign FAB_ARSIZE2 = AXI_M_IO_0_BASE_TO_TOP15;

 //switch matrix multiplexer FAB_ARSIZE1 MUX-1
assign FAB_ARSIZE1 = AXI_M_IO_0_BASE_TO_TOP14;

 //switch matrix multiplexer FAB_ARSIZE0 MUX-1
assign FAB_ARSIZE0 = AXI_M_IO_0_BASE_TO_TOP13;

 //switch matrix multiplexer FAB_ARBURST1 MUX-1
assign FAB_ARBURST1 = AXI_M_IO_0_BASE_TO_TOP12;

 //switch matrix multiplexer FAB_ARBURST0 MUX-1
assign FAB_ARBURST0 = AXI_M_IO_0_BASE_TO_TOP11;

 //switch matrix multiplexer FAB_ARVALID MUX-1
assign FAB_ARVALID = AXI_M_IO_0_BASE_TO_TOP10;

 //switch matrix multiplexer FAB_RREADY MUX-1
assign FAB_RREADY = AXI_M_IO_0_BASE_TO_TOP9;

endmodule