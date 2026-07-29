module AXIL_S_IO
    #(
`ifdef EMULATION
        parameter [639:0] Tile_X0Y0_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y1_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y2_Emulate_Bitstream=640'b0,
        parameter [639:0] Tile_X0Y3_Emulate_Bitstream=640'b0,
`endif
        parameter MaxFramesPerCol=20,
        parameter FrameBitsPerRow=32
    )
    (
    //Tile_X0Y0_Direction.NORTH
        output  [3:0] Tile_X0Y0_N1BEG, //Port(Name=N1BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=4,Side=N)
        output  [7:0] Tile_X0Y0_N2BEG, //Port(Name=N2BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
        output  [7:0] Tile_X0Y0_N2BEGb, //Port(Name=N2BEGb,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
        output  [15:0] Tile_X0Y0_N4BEG, //Port(Name=N4BEG,IO=OUTPUT,XOffset=0,YOffset=-4,WireCount=4,Side=N)
        input  [3:0] Tile_X0Y0_S1END, //Port(Name=S1END,IO=INPUT,XOffset=0,YOffset=1,WireCount=4,Side=N)
        input  [7:0] Tile_X0Y0_S2MID, //Port(Name=S2MID,IO=INPUT,XOffset=0,YOffset=1,WireCount=8,Side=N)
        input  [7:0] Tile_X0Y0_S2END, //Port(Name=S2END,IO=INPUT,XOffset=0,YOffset=1,WireCount=8,Side=N)
        input  [15:0] Tile_X0Y0_S4END, //Port(Name=S4END,IO=INPUT,XOffset=0,YOffset=4,WireCount=4,Side=N)
    //Tile_X0Y0_Direction.EAST
        input  [3:0] Tile_X0Y0_E1END, //Port(Name=E1END,IO=INPUT,XOffset=1,YOffset=0,WireCount=4,Side=W)
        input  [7:0] Tile_X0Y0_E2MID, //Port(Name=E2MID,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [7:0] Tile_X0Y0_E2END, //Port(Name=E2END,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [15:0] Tile_X0Y0_EE4END, //Port(Name=EE4END,IO=INPUT,XOffset=4,YOffset=0,WireCount=4,Side=W)
        input  [11:0] Tile_X0Y0_E6END, //Port(Name=E6END,IO=INPUT,XOffset=6,YOffset=0,WireCount=2,Side=W)
        output  [3:0] Tile_X0Y0_W1BEG, //Port(Name=W1BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=4,Side=W)
        output  [7:0] Tile_X0Y0_W2BEG, //Port(Name=W2BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [7:0] Tile_X0Y0_W2BEGb, //Port(Name=W2BEGb,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [15:0] Tile_X0Y0_WW4BEG, //Port(Name=WW4BEG,IO=OUTPUT,XOffset=-4,YOffset=0,WireCount=4,Side=W)
        output  [11:0] Tile_X0Y0_W6BEG, //Port(Name=W6BEG,IO=OUTPUT,XOffset=-6,YOffset=0,WireCount=2,Side=W)
    //Tile_X0Y1_Direction.EAST
        input  [3:0] Tile_X0Y1_E1END, //Port(Name=E1END,IO=INPUT,XOffset=1,YOffset=0,WireCount=4,Side=W)
        input  [7:0] Tile_X0Y1_E2MID, //Port(Name=E2MID,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [7:0] Tile_X0Y1_E2END, //Port(Name=E2END,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [15:0] Tile_X0Y1_EE4END, //Port(Name=EE4END,IO=INPUT,XOffset=4,YOffset=0,WireCount=4,Side=W)
        input  [11:0] Tile_X0Y1_E6END, //Port(Name=E6END,IO=INPUT,XOffset=6,YOffset=0,WireCount=2,Side=W)
        output  [3:0] Tile_X0Y1_W1BEG, //Port(Name=W1BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=4,Side=W)
        output  [7:0] Tile_X0Y1_W2BEG, //Port(Name=W2BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [7:0] Tile_X0Y1_W2BEGb, //Port(Name=W2BEGb,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [15:0] Tile_X0Y1_WW4BEG, //Port(Name=WW4BEG,IO=OUTPUT,XOffset=-4,YOffset=0,WireCount=4,Side=W)
        output  [11:0] Tile_X0Y1_W6BEG, //Port(Name=W6BEG,IO=OUTPUT,XOffset=-6,YOffset=0,WireCount=2,Side=W)
    //Tile_X0Y2_Direction.EAST
        input  [3:0] Tile_X0Y2_E1END, //Port(Name=E1END,IO=INPUT,XOffset=1,YOffset=0,WireCount=4,Side=W)
        input  [7:0] Tile_X0Y2_E2MID, //Port(Name=E2MID,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [7:0] Tile_X0Y2_E2END, //Port(Name=E2END,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [15:0] Tile_X0Y2_EE4END, //Port(Name=EE4END,IO=INPUT,XOffset=4,YOffset=0,WireCount=4,Side=W)
        input  [11:0] Tile_X0Y2_E6END, //Port(Name=E6END,IO=INPUT,XOffset=6,YOffset=0,WireCount=2,Side=W)
        output  [3:0] Tile_X0Y2_W1BEG, //Port(Name=W1BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=4,Side=W)
        output  [7:0] Tile_X0Y2_W2BEG, //Port(Name=W2BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [7:0] Tile_X0Y2_W2BEGb, //Port(Name=W2BEGb,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [15:0] Tile_X0Y2_WW4BEG, //Port(Name=WW4BEG,IO=OUTPUT,XOffset=-4,YOffset=0,WireCount=4,Side=W)
        output  [11:0] Tile_X0Y2_W6BEG, //Port(Name=W6BEG,IO=OUTPUT,XOffset=-6,YOffset=0,WireCount=2,Side=W)
    //Tile_X0Y3_Direction.NORTH
        input  [3:0] Tile_X0Y3_N1END, //Port(Name=N1END,IO=INPUT,XOffset=0,YOffset=-1,WireCount=4,Side=S)
        input  [7:0] Tile_X0Y3_N2MID, //Port(Name=N2MID,IO=INPUT,XOffset=0,YOffset=-1,WireCount=8,Side=S)
        input  [7:0] Tile_X0Y3_N2END, //Port(Name=N2END,IO=INPUT,XOffset=0,YOffset=-1,WireCount=8,Side=S)
        input  [15:0] Tile_X0Y3_N4END, //Port(Name=N4END,IO=INPUT,XOffset=0,YOffset=-4,WireCount=4,Side=S)
        output  [3:0] Tile_X0Y3_S1BEG, //Port(Name=S1BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=4,Side=S)
        output  [7:0] Tile_X0Y3_S2BEG, //Port(Name=S2BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
        output  [7:0] Tile_X0Y3_S2BEGb, //Port(Name=S2BEGb,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
        output  [15:0] Tile_X0Y3_S4BEG, //Port(Name=S4BEG,IO=OUTPUT,XOffset=0,YOffset=4,WireCount=4,Side=S)
    //Tile_X0Y3_Direction.EAST
        input  [3:0] Tile_X0Y3_E1END, //Port(Name=E1END,IO=INPUT,XOffset=1,YOffset=0,WireCount=4,Side=W)
        input  [7:0] Tile_X0Y3_E2MID, //Port(Name=E2MID,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [7:0] Tile_X0Y3_E2END, //Port(Name=E2END,IO=INPUT,XOffset=1,YOffset=0,WireCount=8,Side=W)
        input  [15:0] Tile_X0Y3_EE4END, //Port(Name=EE4END,IO=INPUT,XOffset=4,YOffset=0,WireCount=4,Side=W)
        input  [11:0] Tile_X0Y3_E6END, //Port(Name=E6END,IO=INPUT,XOffset=6,YOffset=0,WireCount=2,Side=W)
        output  [3:0] Tile_X0Y3_W1BEG, //Port(Name=W1BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=4,Side=W)
        output  [7:0] Tile_X0Y3_W2BEG, //Port(Name=W2BEG,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [7:0] Tile_X0Y3_W2BEGb, //Port(Name=W2BEGb,IO=OUTPUT,XOffset=-1,YOffset=0,WireCount=8,Side=W)
        output  [15:0] Tile_X0Y3_WW4BEG, //Port(Name=WW4BEG,IO=OUTPUT,XOffset=-4,YOffset=0,WireCount=4,Side=W)
        output  [11:0] Tile_X0Y3_W6BEG, //Port(Name=W6BEG,IO=OUTPUT,XOffset=-6,YOffset=0,WireCount=2,Side=W)
    //Tile IO ports from BELs
    //SuperTile BEL IO ports
        input  SOC_AWADDR0,
        input  SOC_AWADDR1,
        input  SOC_AWADDR2,
        input  SOC_AWADDR3,
        input  SOC_AWADDR4,
        input  SOC_AWADDR5,
        input  SOC_AWADDR6,
        input  SOC_AWADDR7,
        input  SOC_AWADDR8,
        input  SOC_AWADDR9,
        input  SOC_AWVALID,
        input  SOC_WDATA0,
        input  SOC_WDATA1,
        input  SOC_WDATA2,
        input  SOC_WDATA3,
        input  SOC_WDATA4,
        input  SOC_WDATA5,
        input  SOC_WDATA6,
        input  SOC_WDATA7,
        input  SOC_WDATA8,
        input  SOC_WDATA9,
        input  SOC_WDATA10,
        input  SOC_WDATA11,
        input  SOC_WDATA12,
        input  SOC_WDATA13,
        input  SOC_WDATA14,
        input  SOC_WDATA15,
        input  SOC_WDATA16,
        input  SOC_WDATA17,
        input  SOC_WDATA18,
        input  SOC_WDATA19,
        input  SOC_WDATA20,
        input  SOC_WDATA21,
        input  SOC_WDATA22,
        input  SOC_WDATA23,
        input  SOC_WDATA24,
        input  SOC_WDATA25,
        input  SOC_WDATA26,
        input  SOC_WDATA27,
        input  SOC_WDATA28,
        input  SOC_WDATA29,
        input  SOC_WDATA30,
        input  SOC_WDATA31,
        input  SOC_WSTRB0,
        input  SOC_WSTRB1,
        input  SOC_WSTRB2,
        input  SOC_WSTRB3,
        input  SOC_WVALID,
        input  SOC_BREADY,
        input  SOC_ARADDR0,
        input  SOC_ARADDR1,
        input  SOC_ARADDR2,
        input  SOC_ARADDR3,
        input  SOC_ARADDR4,
        input  SOC_ARADDR5,
        input  SOC_ARADDR6,
        input  SOC_ARADDR7,
        input  SOC_ARADDR8,
        input  SOC_ARADDR9,
        input  SOC_ARVALID,
        input  SOC_RREADY,
        output  SOC_AWREADY,
        output  SOC_WREADY,
        output  SOC_BRESP0,
        output  SOC_BRESP1,
        output  SOC_BVALID,
        output  SOC_ARREADY,
        output  SOC_RDATA0,
        output  SOC_RDATA1,
        output  SOC_RDATA2,
        output  SOC_RDATA3,
        output  SOC_RDATA4,
        output  SOC_RDATA5,
        output  SOC_RDATA6,
        output  SOC_RDATA7,
        output  SOC_RDATA8,
        output  SOC_RDATA9,
        output  SOC_RDATA10,
        output  SOC_RDATA11,
        output  SOC_RDATA12,
        output  SOC_RDATA13,
        output  SOC_RDATA14,
        output  SOC_RDATA15,
        output  SOC_RDATA16,
        output  SOC_RDATA17,
        output  SOC_RDATA18,
        output  SOC_RDATA19,
        output  SOC_RDATA20,
        output  SOC_RDATA21,
        output  SOC_RDATA22,
        output  SOC_RDATA23,
        output  SOC_RDATA24,
        output  SOC_RDATA25,
        output  SOC_RDATA26,
        output  SOC_RDATA27,
        output  SOC_RDATA28,
        output  SOC_RDATA29,
        output  SOC_RDATA30,
        output  SOC_RDATA31,
        output  SOC_RRESP0,
        output  SOC_RRESP1,
        output  SOC_RVALID,
        output  [MaxFramesPerCol-1:0] Tile_X0Y0_FrameStrobe_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y0_FrameData, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y0_FrameData_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y1_FrameData, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y1_FrameData_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y2_FrameData, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y2_FrameData_O, //CONFIG_PORT
        input  [FrameBitsPerRow-1:0] Tile_X0Y3_FrameData, //CONFIG_PORT
        input  [MaxFramesPerCol-1:0] Tile_X0Y3_FrameStrobe, //CONFIG_PORT
        output  [FrameBitsPerRow-1:0] Tile_X0Y3_FrameData_O, //CONFIG_PORT
        output  Tile_X0Y0_UserCLKo,
        input  Tile_X0Y3_UserCLK
);

 //signal declarations
 //SJUMP signals (child tile -> supertile SM)
    wire[12-1:0] AXIL_S_IO_3_BASE_TO_TOP;
    wire[12-1:0] AXIL_S_IO_2_BASE_TO_TOP;
    wire[12-1:0] AXIL_S_IO_1_BASE_TO_TOP;
    wire[12-1:0] AXIL_S_IO_0_BASE_TO_TOP;
 //SJUMP signals (supertile SM -> child tile)
    wire[16-1:0] AXIL_S_IO_3_TOP_TO_BASE;
    wire[16-1:0] AXIL_S_IO_2_TOP_TO_BASE;
    wire[16-1:0] AXIL_S_IO_1_TOP_TO_BASE;
    wire[16-1:0] AXIL_S_IO_0_TOP_TO_BASE;
 //BEL pin signals (BEL <-> supertile SM)
    wire FAB_AWREADY;
    wire FAB_WREADY;
    wire FAB_BRESP0;
    wire FAB_BRESP1;
    wire FAB_BVALID;
    wire FAB_ARREADY;
    wire FAB_RDATA0;
    wire FAB_RDATA1;
    wire FAB_RDATA2;
    wire FAB_RDATA3;
    wire FAB_RDATA4;
    wire FAB_RDATA5;
    wire FAB_RDATA6;
    wire FAB_RDATA7;
    wire FAB_RDATA8;
    wire FAB_RDATA9;
    wire FAB_RDATA10;
    wire FAB_RDATA11;
    wire FAB_RDATA12;
    wire FAB_RDATA13;
    wire FAB_RDATA14;
    wire FAB_RDATA15;
    wire FAB_RDATA16;
    wire FAB_RDATA17;
    wire FAB_RDATA18;
    wire FAB_RDATA19;
    wire FAB_RDATA20;
    wire FAB_RDATA21;
    wire FAB_RDATA22;
    wire FAB_RDATA23;
    wire FAB_RDATA24;
    wire FAB_RDATA25;
    wire FAB_RDATA26;
    wire FAB_RDATA27;
    wire FAB_RDATA28;
    wire FAB_RDATA29;
    wire FAB_RDATA30;
    wire FAB_RDATA31;
    wire FAB_RRESP0;
    wire FAB_RRESP1;
    wire FAB_RVALID;
    wire FAB_AWADDR0;
    wire FAB_AWADDR1;
    wire FAB_AWADDR2;
    wire FAB_AWADDR3;
    wire FAB_AWADDR4;
    wire FAB_AWADDR5;
    wire FAB_AWADDR6;
    wire FAB_AWADDR7;
    wire FAB_AWADDR8;
    wire FAB_AWADDR9;
    wire FAB_AWVALID;
    wire FAB_WDATA0;
    wire FAB_WDATA1;
    wire FAB_WDATA2;
    wire FAB_WDATA3;
    wire FAB_WDATA4;
    wire FAB_WDATA5;
    wire FAB_WDATA6;
    wire FAB_WDATA7;
    wire FAB_WDATA8;
    wire FAB_WDATA9;
    wire FAB_WDATA10;
    wire FAB_WDATA11;
    wire FAB_WDATA12;
    wire FAB_WDATA13;
    wire FAB_WDATA14;
    wire FAB_WDATA15;
    wire FAB_WDATA16;
    wire FAB_WDATA17;
    wire FAB_WDATA18;
    wire FAB_WDATA19;
    wire FAB_WDATA20;
    wire FAB_WDATA21;
    wire FAB_WDATA22;
    wire FAB_WDATA23;
    wire FAB_WDATA24;
    wire FAB_WDATA25;
    wire FAB_WDATA26;
    wire FAB_WDATA27;
    wire FAB_WDATA28;
    wire FAB_WDATA29;
    wire FAB_WDATA30;
    wire FAB_WDATA31;
    wire FAB_WSTRB0;
    wire FAB_WSTRB1;
    wire FAB_WSTRB2;
    wire FAB_WSTRB3;
    wire FAB_WVALID;
    wire FAB_BREADY;
    wire FAB_ARADDR0;
    wire FAB_ARADDR1;
    wire FAB_ARADDR2;
    wire FAB_ARADDR3;
    wire FAB_ARADDR4;
    wire FAB_ARADDR5;
    wire FAB_ARADDR6;
    wire FAB_ARADDR7;
    wire FAB_ARADDR8;
    wire FAB_ARADDR9;
    wire FAB_ARVALID;
    wire FAB_RREADY;
 //Tile_X0Y0_Direction.NORTH
    wire[3:0] Tile_X0Y0_S1BEG; //Port(Name=S1BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=4,Side=S)
    wire[7:0] Tile_X0Y0_S2BEG; //Port(Name=S2BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[7:0] Tile_X0Y0_S2BEGb; //Port(Name=S2BEGb,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[15:0] Tile_X0Y0_S4BEG; //Port(Name=S4BEG,IO=OUTPUT,XOffset=0,YOffset=4,WireCount=4,Side=S)
 //Tile_X0Y1_Direction.NORTH
    wire[3:0] Tile_X0Y1_N1BEG; //Port(Name=N1BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=4,Side=N)
    wire[7:0] Tile_X0Y1_N2BEG; //Port(Name=N2BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[7:0] Tile_X0Y1_N2BEGb; //Port(Name=N2BEGb,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[15:0] Tile_X0Y1_N4BEG; //Port(Name=N4BEG,IO=OUTPUT,XOffset=0,YOffset=-4,WireCount=4,Side=N)
 //Tile_X0Y1_Direction.NORTH
    wire[3:0] Tile_X0Y1_S1BEG; //Port(Name=S1BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=4,Side=S)
    wire[7:0] Tile_X0Y1_S2BEG; //Port(Name=S2BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[7:0] Tile_X0Y1_S2BEGb; //Port(Name=S2BEGb,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[15:0] Tile_X0Y1_S4BEG; //Port(Name=S4BEG,IO=OUTPUT,XOffset=0,YOffset=4,WireCount=4,Side=S)
 //Tile_X0Y2_Direction.NORTH
    wire[3:0] Tile_X0Y2_N1BEG; //Port(Name=N1BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=4,Side=N)
    wire[7:0] Tile_X0Y2_N2BEG; //Port(Name=N2BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[7:0] Tile_X0Y2_N2BEGb; //Port(Name=N2BEGb,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[15:0] Tile_X0Y2_N4BEG; //Port(Name=N4BEG,IO=OUTPUT,XOffset=0,YOffset=-4,WireCount=4,Side=N)
 //Tile_X0Y2_Direction.NORTH
    wire[3:0] Tile_X0Y2_S1BEG; //Port(Name=S1BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=4,Side=S)
    wire[7:0] Tile_X0Y2_S2BEG; //Port(Name=S2BEG,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[7:0] Tile_X0Y2_S2BEGb; //Port(Name=S2BEGb,IO=OUTPUT,XOffset=0,YOffset=1,WireCount=8,Side=S)
    wire[15:0] Tile_X0Y2_S4BEG; //Port(Name=S4BEG,IO=OUTPUT,XOffset=0,YOffset=4,WireCount=4,Side=S)
 //Tile_X0Y3_Direction.NORTH
    wire[3:0] Tile_X0Y3_N1BEG; //Port(Name=N1BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=4,Side=N)
    wire[7:0] Tile_X0Y3_N2BEG; //Port(Name=N2BEG,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[7:0] Tile_X0Y3_N2BEGb; //Port(Name=N2BEGb,IO=OUTPUT,XOffset=0,YOffset=-1,WireCount=8,Side=N)
    wire[15:0] Tile_X0Y3_N4BEG; //Port(Name=N4BEG,IO=OUTPUT,XOffset=0,YOffset=-4,WireCount=4,Side=N)
    wire[MaxFramesPerCol-1:0] Tile_X0Y1_FrameStrobe_O;
    wire Tile_X0Y1_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X0Y2_FrameStrobe_O;
    wire Tile_X0Y2_UserCLKo;
    wire[MaxFramesPerCol-1:0] Tile_X0Y3_FrameStrobe_O;
    wire Tile_X0Y3_UserCLKo;

AXIL_S_IO_3
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y0_Emulate_Bitstream)
    )
`endif
    Tile_X0Y0_AXIL_S_IO_3
    (
    .N1END(Tile_X0Y1_N1BEG),
    .N2MID(Tile_X0Y1_N2BEG),
    .N2END(Tile_X0Y1_N2BEGb),
    .N4END(Tile_X0Y1_N4BEG),
    .E1END(Tile_X0Y0_E1END),
    .E2MID(Tile_X0Y0_E2MID),
    .E2END(Tile_X0Y0_E2END),
    .EE4END(Tile_X0Y0_EE4END),
    .E6END(Tile_X0Y0_E6END),
    .S1END(Tile_X0Y0_S1END),
    .S2MID(Tile_X0Y0_S2MID),
    .S2END(Tile_X0Y0_S2END),
    .S4END(Tile_X0Y0_S4END),
    .N1BEG(Tile_X0Y0_N1BEG),
    .N2BEG(Tile_X0Y0_N2BEG),
    .N2BEGb(Tile_X0Y0_N2BEGb),
    .N4BEG(Tile_X0Y0_N4BEG),
    .S1BEG(Tile_X0Y0_S1BEG),
    .S2BEG(Tile_X0Y0_S2BEG),
    .S2BEGb(Tile_X0Y0_S2BEGb),
    .S4BEG(Tile_X0Y0_S4BEG),
    .W1BEG(Tile_X0Y0_W1BEG),
    .W2BEG(Tile_X0Y0_W2BEG),
    .W2BEGb(Tile_X0Y0_W2BEGb),
    .WW4BEG(Tile_X0Y0_WW4BEG),
    .W6BEG(Tile_X0Y0_W6BEG),
    .BASE_TO_TOP(AXIL_S_IO_3_BASE_TO_TOP),
    .TOP_TO_BASE(AXIL_S_IO_3_TOP_TO_BASE),
    .UserCLK(Tile_X0Y1_UserCLKo),
    .UserCLKo(Tile_X0Y0_UserCLKo),
    .FrameData(Tile_X0Y0_FrameData),
    .FrameData_O(Tile_X0Y0_FrameData_O),
    .FrameStrobe(Tile_X0Y1_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y0_FrameStrobe_O)
);

AXIL_S_IO_2
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y1_Emulate_Bitstream)
    )
`endif
    Tile_X0Y1_AXIL_S_IO_2
    (
    .N1END(Tile_X0Y2_N1BEG),
    .N2MID(Tile_X0Y2_N2BEG),
    .N2END(Tile_X0Y2_N2BEGb),
    .N4END(Tile_X0Y2_N4BEG),
    .E1END(Tile_X0Y1_E1END),
    .E2MID(Tile_X0Y1_E2MID),
    .E2END(Tile_X0Y1_E2END),
    .EE4END(Tile_X0Y1_EE4END),
    .E6END(Tile_X0Y1_E6END),
    .S1END(Tile_X0Y0_S1BEG),
    .S2MID(Tile_X0Y0_S2BEG),
    .S2END(Tile_X0Y0_S2BEGb),
    .S4END(Tile_X0Y0_S4BEG),
    .N1BEG(Tile_X0Y1_N1BEG),
    .N2BEG(Tile_X0Y1_N2BEG),
    .N2BEGb(Tile_X0Y1_N2BEGb),
    .N4BEG(Tile_X0Y1_N4BEG),
    .S1BEG(Tile_X0Y1_S1BEG),
    .S2BEG(Tile_X0Y1_S2BEG),
    .S2BEGb(Tile_X0Y1_S2BEGb),
    .S4BEG(Tile_X0Y1_S4BEG),
    .W1BEG(Tile_X0Y1_W1BEG),
    .W2BEG(Tile_X0Y1_W2BEG),
    .W2BEGb(Tile_X0Y1_W2BEGb),
    .WW4BEG(Tile_X0Y1_WW4BEG),
    .W6BEG(Tile_X0Y1_W6BEG),
    .BASE_TO_TOP(AXIL_S_IO_2_BASE_TO_TOP),
    .TOP_TO_BASE(AXIL_S_IO_2_TOP_TO_BASE),
    .UserCLK(Tile_X0Y2_UserCLKo),
    .UserCLKo(Tile_X0Y1_UserCLKo),
    .FrameData(Tile_X0Y1_FrameData),
    .FrameData_O(Tile_X0Y1_FrameData_O),
    .FrameStrobe(Tile_X0Y2_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y1_FrameStrobe_O)
);

AXIL_S_IO_1
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y2_Emulate_Bitstream)
    )
`endif
    Tile_X0Y2_AXIL_S_IO_1
    (
    .N1END(Tile_X0Y3_N1BEG),
    .N2MID(Tile_X0Y3_N2BEG),
    .N2END(Tile_X0Y3_N2BEGb),
    .N4END(Tile_X0Y3_N4BEG),
    .E1END(Tile_X0Y2_E1END),
    .E2MID(Tile_X0Y2_E2MID),
    .E2END(Tile_X0Y2_E2END),
    .EE4END(Tile_X0Y2_EE4END),
    .E6END(Tile_X0Y2_E6END),
    .S1END(Tile_X0Y1_S1BEG),
    .S2MID(Tile_X0Y1_S2BEG),
    .S2END(Tile_X0Y1_S2BEGb),
    .S4END(Tile_X0Y1_S4BEG),
    .N1BEG(Tile_X0Y2_N1BEG),
    .N2BEG(Tile_X0Y2_N2BEG),
    .N2BEGb(Tile_X0Y2_N2BEGb),
    .N4BEG(Tile_X0Y2_N4BEG),
    .S1BEG(Tile_X0Y2_S1BEG),
    .S2BEG(Tile_X0Y2_S2BEG),
    .S2BEGb(Tile_X0Y2_S2BEGb),
    .S4BEG(Tile_X0Y2_S4BEG),
    .W1BEG(Tile_X0Y2_W1BEG),
    .W2BEG(Tile_X0Y2_W2BEG),
    .W2BEGb(Tile_X0Y2_W2BEGb),
    .WW4BEG(Tile_X0Y2_WW4BEG),
    .W6BEG(Tile_X0Y2_W6BEG),
    .BASE_TO_TOP(AXIL_S_IO_1_BASE_TO_TOP),
    .TOP_TO_BASE(AXIL_S_IO_1_TOP_TO_BASE),
    .UserCLK(Tile_X0Y3_UserCLKo),
    .UserCLKo(Tile_X0Y2_UserCLKo),
    .FrameData(Tile_X0Y2_FrameData),
    .FrameData_O(Tile_X0Y2_FrameData_O),
    .FrameStrobe(Tile_X0Y3_FrameStrobe_O),
    .FrameStrobe_O(Tile_X0Y2_FrameStrobe_O)
);

AXIL_S_IO_0
`ifdef EMULATION
    #(
    .Emulate_Bitstream(Tile_X0Y3_Emulate_Bitstream)
    )
`endif
    Tile_X0Y3_AXIL_S_IO_0
    (
    .N1END(Tile_X0Y3_N1END),
    .N2MID(Tile_X0Y3_N2MID),
    .N2END(Tile_X0Y3_N2END),
    .N4END(Tile_X0Y3_N4END),
    .E1END(Tile_X0Y3_E1END),
    .E2MID(Tile_X0Y3_E2MID),
    .E2END(Tile_X0Y3_E2END),
    .EE4END(Tile_X0Y3_EE4END),
    .E6END(Tile_X0Y3_E6END),
    .S1END(Tile_X0Y2_S1BEG),
    .S2MID(Tile_X0Y2_S2BEG),
    .S2END(Tile_X0Y2_S2BEGb),
    .S4END(Tile_X0Y2_S4BEG),
    .N1BEG(Tile_X0Y3_N1BEG),
    .N2BEG(Tile_X0Y3_N2BEG),
    .N2BEGb(Tile_X0Y3_N2BEGb),
    .N4BEG(Tile_X0Y3_N4BEG),
    .S1BEG(Tile_X0Y3_S1BEG),
    .S2BEG(Tile_X0Y3_S2BEG),
    .S2BEGb(Tile_X0Y3_S2BEGb),
    .S4BEG(Tile_X0Y3_S4BEG),
    .W1BEG(Tile_X0Y3_W1BEG),
    .W2BEG(Tile_X0Y3_W2BEG),
    .W2BEGb(Tile_X0Y3_W2BEGb),
    .WW4BEG(Tile_X0Y3_WW4BEG),
    .W6BEG(Tile_X0Y3_W6BEG),
    .BASE_TO_TOP(AXIL_S_IO_0_BASE_TO_TOP),
    .TOP_TO_BASE(AXIL_S_IO_0_TOP_TO_BASE),
    .UserCLK(Tile_X0Y3_UserCLK),
    .UserCLKo(Tile_X0Y3_UserCLKo),
    .FrameData(Tile_X0Y3_FrameData),
    .FrameData_O(Tile_X0Y3_FrameData_O),
    .FrameStrobe(Tile_X0Y3_FrameStrobe),
    .FrameStrobe_O(Tile_X0Y3_FrameStrobe_O)
);

AXIL_S_IO_switch_matrix Inst_AXIL_S_IO_switch_matrix (
    .AXIL_S_IO_3_BASE_TO_TOP0(AXIL_S_IO_3_BASE_TO_TOP[0]),
    .AXIL_S_IO_3_BASE_TO_TOP1(AXIL_S_IO_3_BASE_TO_TOP[1]),
    .AXIL_S_IO_3_BASE_TO_TOP2(AXIL_S_IO_3_BASE_TO_TOP[2]),
    .AXIL_S_IO_3_BASE_TO_TOP3(AXIL_S_IO_3_BASE_TO_TOP[3]),
    .AXIL_S_IO_3_BASE_TO_TOP4(AXIL_S_IO_3_BASE_TO_TOP[4]),
    .AXIL_S_IO_3_BASE_TO_TOP5(AXIL_S_IO_3_BASE_TO_TOP[5]),
    .AXIL_S_IO_3_BASE_TO_TOP6(AXIL_S_IO_3_BASE_TO_TOP[6]),
    .AXIL_S_IO_3_BASE_TO_TOP7(AXIL_S_IO_3_BASE_TO_TOP[7]),
    .AXIL_S_IO_3_BASE_TO_TOP8(AXIL_S_IO_3_BASE_TO_TOP[8]),
    .AXIL_S_IO_3_BASE_TO_TOP9(AXIL_S_IO_3_BASE_TO_TOP[9]),
    .AXIL_S_IO_3_BASE_TO_TOP10(AXIL_S_IO_3_BASE_TO_TOP[10]),
    .AXIL_S_IO_3_BASE_TO_TOP11(AXIL_S_IO_3_BASE_TO_TOP[11]),
    .AXIL_S_IO_2_BASE_TO_TOP0(AXIL_S_IO_2_BASE_TO_TOP[0]),
    .AXIL_S_IO_2_BASE_TO_TOP1(AXIL_S_IO_2_BASE_TO_TOP[1]),
    .AXIL_S_IO_2_BASE_TO_TOP2(AXIL_S_IO_2_BASE_TO_TOP[2]),
    .AXIL_S_IO_2_BASE_TO_TOP3(AXIL_S_IO_2_BASE_TO_TOP[3]),
    .AXIL_S_IO_2_BASE_TO_TOP4(AXIL_S_IO_2_BASE_TO_TOP[4]),
    .AXIL_S_IO_2_BASE_TO_TOP5(AXIL_S_IO_2_BASE_TO_TOP[5]),
    .AXIL_S_IO_2_BASE_TO_TOP6(AXIL_S_IO_2_BASE_TO_TOP[6]),
    .AXIL_S_IO_2_BASE_TO_TOP7(AXIL_S_IO_2_BASE_TO_TOP[7]),
    .AXIL_S_IO_2_BASE_TO_TOP8(AXIL_S_IO_2_BASE_TO_TOP[8]),
    .AXIL_S_IO_2_BASE_TO_TOP9(AXIL_S_IO_2_BASE_TO_TOP[9]),
    .AXIL_S_IO_2_BASE_TO_TOP10(AXIL_S_IO_2_BASE_TO_TOP[10]),
    .AXIL_S_IO_2_BASE_TO_TOP11(AXIL_S_IO_2_BASE_TO_TOP[11]),
    .AXIL_S_IO_1_BASE_TO_TOP0(AXIL_S_IO_1_BASE_TO_TOP[0]),
    .AXIL_S_IO_1_BASE_TO_TOP1(AXIL_S_IO_1_BASE_TO_TOP[1]),
    .AXIL_S_IO_1_BASE_TO_TOP2(AXIL_S_IO_1_BASE_TO_TOP[2]),
    .AXIL_S_IO_1_BASE_TO_TOP3(AXIL_S_IO_1_BASE_TO_TOP[3]),
    .AXIL_S_IO_1_BASE_TO_TOP4(AXIL_S_IO_1_BASE_TO_TOP[4]),
    .AXIL_S_IO_1_BASE_TO_TOP5(AXIL_S_IO_1_BASE_TO_TOP[5]),
    .AXIL_S_IO_1_BASE_TO_TOP6(AXIL_S_IO_1_BASE_TO_TOP[6]),
    .AXIL_S_IO_1_BASE_TO_TOP7(AXIL_S_IO_1_BASE_TO_TOP[7]),
    .AXIL_S_IO_1_BASE_TO_TOP8(AXIL_S_IO_1_BASE_TO_TOP[8]),
    .AXIL_S_IO_1_BASE_TO_TOP9(AXIL_S_IO_1_BASE_TO_TOP[9]),
    .AXIL_S_IO_1_BASE_TO_TOP10(AXIL_S_IO_1_BASE_TO_TOP[10]),
    .AXIL_S_IO_1_BASE_TO_TOP11(AXIL_S_IO_1_BASE_TO_TOP[11]),
    .AXIL_S_IO_0_BASE_TO_TOP0(AXIL_S_IO_0_BASE_TO_TOP[0]),
    .AXIL_S_IO_0_BASE_TO_TOP1(AXIL_S_IO_0_BASE_TO_TOP[1]),
    .AXIL_S_IO_0_BASE_TO_TOP2(AXIL_S_IO_0_BASE_TO_TOP[2]),
    .AXIL_S_IO_0_BASE_TO_TOP3(AXIL_S_IO_0_BASE_TO_TOP[3]),
    .AXIL_S_IO_0_BASE_TO_TOP4(AXIL_S_IO_0_BASE_TO_TOP[4]),
    .AXIL_S_IO_0_BASE_TO_TOP5(AXIL_S_IO_0_BASE_TO_TOP[5]),
    .AXIL_S_IO_0_BASE_TO_TOP6(AXIL_S_IO_0_BASE_TO_TOP[6]),
    .AXIL_S_IO_0_BASE_TO_TOP7(AXIL_S_IO_0_BASE_TO_TOP[7]),
    .AXIL_S_IO_0_BASE_TO_TOP8(AXIL_S_IO_0_BASE_TO_TOP[8]),
    .AXIL_S_IO_0_BASE_TO_TOP9(AXIL_S_IO_0_BASE_TO_TOP[9]),
    .AXIL_S_IO_0_BASE_TO_TOP10(AXIL_S_IO_0_BASE_TO_TOP[10]),
    .AXIL_S_IO_0_BASE_TO_TOP11(AXIL_S_IO_0_BASE_TO_TOP[11]),
    .FAB_AWREADY(FAB_AWREADY),
    .FAB_WREADY(FAB_WREADY),
    .FAB_BRESP0(FAB_BRESP0),
    .FAB_BRESP1(FAB_BRESP1),
    .FAB_BVALID(FAB_BVALID),
    .FAB_ARREADY(FAB_ARREADY),
    .FAB_RDATA0(FAB_RDATA0),
    .FAB_RDATA1(FAB_RDATA1),
    .FAB_RDATA2(FAB_RDATA2),
    .FAB_RDATA3(FAB_RDATA3),
    .FAB_RDATA4(FAB_RDATA4),
    .FAB_RDATA5(FAB_RDATA5),
    .FAB_RDATA6(FAB_RDATA6),
    .FAB_RDATA7(FAB_RDATA7),
    .FAB_RDATA8(FAB_RDATA8),
    .FAB_RDATA9(FAB_RDATA9),
    .FAB_RDATA10(FAB_RDATA10),
    .FAB_RDATA11(FAB_RDATA11),
    .FAB_RDATA12(FAB_RDATA12),
    .FAB_RDATA13(FAB_RDATA13),
    .FAB_RDATA14(FAB_RDATA14),
    .FAB_RDATA15(FAB_RDATA15),
    .FAB_RDATA16(FAB_RDATA16),
    .FAB_RDATA17(FAB_RDATA17),
    .FAB_RDATA18(FAB_RDATA18),
    .FAB_RDATA19(FAB_RDATA19),
    .FAB_RDATA20(FAB_RDATA20),
    .FAB_RDATA21(FAB_RDATA21),
    .FAB_RDATA22(FAB_RDATA22),
    .FAB_RDATA23(FAB_RDATA23),
    .FAB_RDATA24(FAB_RDATA24),
    .FAB_RDATA25(FAB_RDATA25),
    .FAB_RDATA26(FAB_RDATA26),
    .FAB_RDATA27(FAB_RDATA27),
    .FAB_RDATA28(FAB_RDATA28),
    .FAB_RDATA29(FAB_RDATA29),
    .FAB_RDATA30(FAB_RDATA30),
    .FAB_RDATA31(FAB_RDATA31),
    .FAB_RRESP0(FAB_RRESP0),
    .FAB_RRESP1(FAB_RRESP1),
    .FAB_RVALID(FAB_RVALID),
    .FAB_AWADDR0(FAB_AWADDR0),
    .FAB_AWADDR1(FAB_AWADDR1),
    .FAB_AWADDR2(FAB_AWADDR2),
    .FAB_AWADDR3(FAB_AWADDR3),
    .FAB_AWADDR4(FAB_AWADDR4),
    .FAB_AWADDR5(FAB_AWADDR5),
    .FAB_AWADDR6(FAB_AWADDR6),
    .FAB_AWADDR7(FAB_AWADDR7),
    .FAB_AWADDR8(FAB_AWADDR8),
    .FAB_AWADDR9(FAB_AWADDR9),
    .FAB_AWVALID(FAB_AWVALID),
    .FAB_WDATA0(FAB_WDATA0),
    .FAB_WDATA1(FAB_WDATA1),
    .FAB_WDATA2(FAB_WDATA2),
    .FAB_WDATA3(FAB_WDATA3),
    .FAB_WDATA4(FAB_WDATA4),
    .FAB_WDATA5(FAB_WDATA5),
    .FAB_WDATA6(FAB_WDATA6),
    .FAB_WDATA7(FAB_WDATA7),
    .FAB_WDATA8(FAB_WDATA8),
    .FAB_WDATA9(FAB_WDATA9),
    .FAB_WDATA10(FAB_WDATA10),
    .FAB_WDATA11(FAB_WDATA11),
    .FAB_WDATA12(FAB_WDATA12),
    .FAB_WDATA13(FAB_WDATA13),
    .FAB_WDATA14(FAB_WDATA14),
    .FAB_WDATA15(FAB_WDATA15),
    .FAB_WDATA16(FAB_WDATA16),
    .FAB_WDATA17(FAB_WDATA17),
    .FAB_WDATA18(FAB_WDATA18),
    .FAB_WDATA19(FAB_WDATA19),
    .FAB_WDATA20(FAB_WDATA20),
    .FAB_WDATA21(FAB_WDATA21),
    .FAB_WDATA22(FAB_WDATA22),
    .FAB_WDATA23(FAB_WDATA23),
    .FAB_WDATA24(FAB_WDATA24),
    .FAB_WDATA25(FAB_WDATA25),
    .FAB_WDATA26(FAB_WDATA26),
    .FAB_WDATA27(FAB_WDATA27),
    .FAB_WDATA28(FAB_WDATA28),
    .FAB_WDATA29(FAB_WDATA29),
    .FAB_WDATA30(FAB_WDATA30),
    .FAB_WDATA31(FAB_WDATA31),
    .FAB_WSTRB0(FAB_WSTRB0),
    .FAB_WSTRB1(FAB_WSTRB1),
    .FAB_WSTRB2(FAB_WSTRB2),
    .FAB_WSTRB3(FAB_WSTRB3),
    .FAB_WVALID(FAB_WVALID),
    .FAB_BREADY(FAB_BREADY),
    .FAB_ARADDR0(FAB_ARADDR0),
    .FAB_ARADDR1(FAB_ARADDR1),
    .FAB_ARADDR2(FAB_ARADDR2),
    .FAB_ARADDR3(FAB_ARADDR3),
    .FAB_ARADDR4(FAB_ARADDR4),
    .FAB_ARADDR5(FAB_ARADDR5),
    .FAB_ARADDR6(FAB_ARADDR6),
    .FAB_ARADDR7(FAB_ARADDR7),
    .FAB_ARADDR8(FAB_ARADDR8),
    .FAB_ARADDR9(FAB_ARADDR9),
    .FAB_ARVALID(FAB_ARVALID),
    .FAB_RREADY(FAB_RREADY),
    .AXIL_S_IO_3_TOP_TO_BASE0(AXIL_S_IO_3_TOP_TO_BASE[0]),
    .AXIL_S_IO_3_TOP_TO_BASE1(AXIL_S_IO_3_TOP_TO_BASE[1]),
    .AXIL_S_IO_3_TOP_TO_BASE2(AXIL_S_IO_3_TOP_TO_BASE[2]),
    .AXIL_S_IO_3_TOP_TO_BASE3(AXIL_S_IO_3_TOP_TO_BASE[3]),
    .AXIL_S_IO_3_TOP_TO_BASE4(AXIL_S_IO_3_TOP_TO_BASE[4]),
    .AXIL_S_IO_3_TOP_TO_BASE5(AXIL_S_IO_3_TOP_TO_BASE[5]),
    .AXIL_S_IO_3_TOP_TO_BASE6(AXIL_S_IO_3_TOP_TO_BASE[6]),
    .AXIL_S_IO_3_TOP_TO_BASE7(AXIL_S_IO_3_TOP_TO_BASE[7]),
    .AXIL_S_IO_3_TOP_TO_BASE8(AXIL_S_IO_3_TOP_TO_BASE[8]),
    .AXIL_S_IO_3_TOP_TO_BASE9(AXIL_S_IO_3_TOP_TO_BASE[9]),
    .AXIL_S_IO_3_TOP_TO_BASE10(AXIL_S_IO_3_TOP_TO_BASE[10]),
    .AXIL_S_IO_3_TOP_TO_BASE11(AXIL_S_IO_3_TOP_TO_BASE[11]),
    .AXIL_S_IO_3_TOP_TO_BASE12(AXIL_S_IO_3_TOP_TO_BASE[12]),
    .AXIL_S_IO_3_TOP_TO_BASE13(AXIL_S_IO_3_TOP_TO_BASE[13]),
    .AXIL_S_IO_3_TOP_TO_BASE14(AXIL_S_IO_3_TOP_TO_BASE[14]),
    .AXIL_S_IO_3_TOP_TO_BASE15(AXIL_S_IO_3_TOP_TO_BASE[15]),
    .AXIL_S_IO_2_TOP_TO_BASE0(AXIL_S_IO_2_TOP_TO_BASE[0]),
    .AXIL_S_IO_2_TOP_TO_BASE1(AXIL_S_IO_2_TOP_TO_BASE[1]),
    .AXIL_S_IO_2_TOP_TO_BASE2(AXIL_S_IO_2_TOP_TO_BASE[2]),
    .AXIL_S_IO_2_TOP_TO_BASE3(AXIL_S_IO_2_TOP_TO_BASE[3]),
    .AXIL_S_IO_2_TOP_TO_BASE4(AXIL_S_IO_2_TOP_TO_BASE[4]),
    .AXIL_S_IO_2_TOP_TO_BASE5(AXIL_S_IO_2_TOP_TO_BASE[5]),
    .AXIL_S_IO_2_TOP_TO_BASE6(AXIL_S_IO_2_TOP_TO_BASE[6]),
    .AXIL_S_IO_2_TOP_TO_BASE7(AXIL_S_IO_2_TOP_TO_BASE[7]),
    .AXIL_S_IO_2_TOP_TO_BASE8(AXIL_S_IO_2_TOP_TO_BASE[8]),
    .AXIL_S_IO_2_TOP_TO_BASE9(AXIL_S_IO_2_TOP_TO_BASE[9]),
    .AXIL_S_IO_2_TOP_TO_BASE10(AXIL_S_IO_2_TOP_TO_BASE[10]),
    .AXIL_S_IO_2_TOP_TO_BASE11(AXIL_S_IO_2_TOP_TO_BASE[11]),
    .AXIL_S_IO_2_TOP_TO_BASE12(AXIL_S_IO_2_TOP_TO_BASE[12]),
    .AXIL_S_IO_2_TOP_TO_BASE13(AXIL_S_IO_2_TOP_TO_BASE[13]),
    .AXIL_S_IO_2_TOP_TO_BASE14(AXIL_S_IO_2_TOP_TO_BASE[14]),
    .AXIL_S_IO_2_TOP_TO_BASE15(AXIL_S_IO_2_TOP_TO_BASE[15]),
    .AXIL_S_IO_1_TOP_TO_BASE0(AXIL_S_IO_1_TOP_TO_BASE[0]),
    .AXIL_S_IO_1_TOP_TO_BASE1(AXIL_S_IO_1_TOP_TO_BASE[1]),
    .AXIL_S_IO_1_TOP_TO_BASE2(AXIL_S_IO_1_TOP_TO_BASE[2]),
    .AXIL_S_IO_1_TOP_TO_BASE3(AXIL_S_IO_1_TOP_TO_BASE[3]),
    .AXIL_S_IO_1_TOP_TO_BASE4(AXIL_S_IO_1_TOP_TO_BASE[4]),
    .AXIL_S_IO_1_TOP_TO_BASE5(AXIL_S_IO_1_TOP_TO_BASE[5]),
    .AXIL_S_IO_1_TOP_TO_BASE6(AXIL_S_IO_1_TOP_TO_BASE[6]),
    .AXIL_S_IO_1_TOP_TO_BASE7(AXIL_S_IO_1_TOP_TO_BASE[7]),
    .AXIL_S_IO_1_TOP_TO_BASE8(AXIL_S_IO_1_TOP_TO_BASE[8]),
    .AXIL_S_IO_1_TOP_TO_BASE9(AXIL_S_IO_1_TOP_TO_BASE[9]),
    .AXIL_S_IO_1_TOP_TO_BASE10(AXIL_S_IO_1_TOP_TO_BASE[10]),
    .AXIL_S_IO_1_TOP_TO_BASE11(AXIL_S_IO_1_TOP_TO_BASE[11]),
    .AXIL_S_IO_1_TOP_TO_BASE12(AXIL_S_IO_1_TOP_TO_BASE[12]),
    .AXIL_S_IO_1_TOP_TO_BASE13(AXIL_S_IO_1_TOP_TO_BASE[13]),
    .AXIL_S_IO_1_TOP_TO_BASE14(AXIL_S_IO_1_TOP_TO_BASE[14]),
    .AXIL_S_IO_1_TOP_TO_BASE15(AXIL_S_IO_1_TOP_TO_BASE[15]),
    .AXIL_S_IO_0_TOP_TO_BASE0(AXIL_S_IO_0_TOP_TO_BASE[0]),
    .AXIL_S_IO_0_TOP_TO_BASE1(AXIL_S_IO_0_TOP_TO_BASE[1]),
    .AXIL_S_IO_0_TOP_TO_BASE2(AXIL_S_IO_0_TOP_TO_BASE[2]),
    .AXIL_S_IO_0_TOP_TO_BASE3(AXIL_S_IO_0_TOP_TO_BASE[3]),
    .AXIL_S_IO_0_TOP_TO_BASE4(AXIL_S_IO_0_TOP_TO_BASE[4]),
    .AXIL_S_IO_0_TOP_TO_BASE5(AXIL_S_IO_0_TOP_TO_BASE[5]),
    .AXIL_S_IO_0_TOP_TO_BASE6(AXIL_S_IO_0_TOP_TO_BASE[6]),
    .AXIL_S_IO_0_TOP_TO_BASE7(AXIL_S_IO_0_TOP_TO_BASE[7]),
    .AXIL_S_IO_0_TOP_TO_BASE8(AXIL_S_IO_0_TOP_TO_BASE[8]),
    .AXIL_S_IO_0_TOP_TO_BASE9(AXIL_S_IO_0_TOP_TO_BASE[9]),
    .AXIL_S_IO_0_TOP_TO_BASE10(AXIL_S_IO_0_TOP_TO_BASE[10]),
    .AXIL_S_IO_0_TOP_TO_BASE11(AXIL_S_IO_0_TOP_TO_BASE[11]),
    .AXIL_S_IO_0_TOP_TO_BASE12(AXIL_S_IO_0_TOP_TO_BASE[12]),
    .AXIL_S_IO_0_TOP_TO_BASE13(AXIL_S_IO_0_TOP_TO_BASE[13]),
    .AXIL_S_IO_0_TOP_TO_BASE14(AXIL_S_IO_0_TOP_TO_BASE[14]),
    .AXIL_S_IO_0_TOP_TO_BASE15(AXIL_S_IO_0_TOP_TO_BASE[15])
);

AXIL_S_BEL Inst_ST_AXIL_S_BEL (
    .FAB_AWREADY(FAB_AWREADY),
    .FAB_WREADY(FAB_WREADY),
    .FAB_BRESP({FAB_BRESP1, FAB_BRESP0}),
    .FAB_BVALID(FAB_BVALID),
    .FAB_ARREADY(FAB_ARREADY),
    .FAB_RDATA({FAB_RDATA31, FAB_RDATA30, FAB_RDATA29, FAB_RDATA28, FAB_RDATA27, FAB_RDATA26, FAB_RDATA25, FAB_RDATA24, FAB_RDATA23, FAB_RDATA22, FAB_RDATA21, FAB_RDATA20, FAB_RDATA19, FAB_RDATA18, FAB_RDATA17, FAB_RDATA16, FAB_RDATA15, FAB_RDATA14, FAB_RDATA13, FAB_RDATA12, FAB_RDATA11, FAB_RDATA10, FAB_RDATA9, FAB_RDATA8, FAB_RDATA7, FAB_RDATA6, FAB_RDATA5, FAB_RDATA4, FAB_RDATA3, FAB_RDATA2, FAB_RDATA1, FAB_RDATA0}),
    .FAB_RRESP({FAB_RRESP1, FAB_RRESP0}),
    .FAB_RVALID(FAB_RVALID),
    .FAB_AWADDR({FAB_AWADDR9, FAB_AWADDR8, FAB_AWADDR7, FAB_AWADDR6, FAB_AWADDR5, FAB_AWADDR4, FAB_AWADDR3, FAB_AWADDR2, FAB_AWADDR1, FAB_AWADDR0}),
    .FAB_AWVALID(FAB_AWVALID),
    .FAB_WDATA({FAB_WDATA31, FAB_WDATA30, FAB_WDATA29, FAB_WDATA28, FAB_WDATA27, FAB_WDATA26, FAB_WDATA25, FAB_WDATA24, FAB_WDATA23, FAB_WDATA22, FAB_WDATA21, FAB_WDATA20, FAB_WDATA19, FAB_WDATA18, FAB_WDATA17, FAB_WDATA16, FAB_WDATA15, FAB_WDATA14, FAB_WDATA13, FAB_WDATA12, FAB_WDATA11, FAB_WDATA10, FAB_WDATA9, FAB_WDATA8, FAB_WDATA7, FAB_WDATA6, FAB_WDATA5, FAB_WDATA4, FAB_WDATA3, FAB_WDATA2, FAB_WDATA1, FAB_WDATA0}),
    .FAB_WSTRB({FAB_WSTRB3, FAB_WSTRB2, FAB_WSTRB1, FAB_WSTRB0}),
    .FAB_WVALID(FAB_WVALID),
    .FAB_BREADY(FAB_BREADY),
    .FAB_ARADDR({FAB_ARADDR9, FAB_ARADDR8, FAB_ARADDR7, FAB_ARADDR6, FAB_ARADDR5, FAB_ARADDR4, FAB_ARADDR3, FAB_ARADDR2, FAB_ARADDR1, FAB_ARADDR0}),
    .FAB_ARVALID(FAB_ARVALID),
    .FAB_RREADY(FAB_RREADY),
    .SOC_AWADDR({SOC_AWADDR9, SOC_AWADDR8, SOC_AWADDR7, SOC_AWADDR6, SOC_AWADDR5, SOC_AWADDR4, SOC_AWADDR3, SOC_AWADDR2, SOC_AWADDR1, SOC_AWADDR0}),
    .SOC_AWVALID(SOC_AWVALID),
    .SOC_WDATA({SOC_WDATA31, SOC_WDATA30, SOC_WDATA29, SOC_WDATA28, SOC_WDATA27, SOC_WDATA26, SOC_WDATA25, SOC_WDATA24, SOC_WDATA23, SOC_WDATA22, SOC_WDATA21, SOC_WDATA20, SOC_WDATA19, SOC_WDATA18, SOC_WDATA17, SOC_WDATA16, SOC_WDATA15, SOC_WDATA14, SOC_WDATA13, SOC_WDATA12, SOC_WDATA11, SOC_WDATA10, SOC_WDATA9, SOC_WDATA8, SOC_WDATA7, SOC_WDATA6, SOC_WDATA5, SOC_WDATA4, SOC_WDATA3, SOC_WDATA2, SOC_WDATA1, SOC_WDATA0}),
    .SOC_WSTRB({SOC_WSTRB3, SOC_WSTRB2, SOC_WSTRB1, SOC_WSTRB0}),
    .SOC_WVALID(SOC_WVALID),
    .SOC_BREADY(SOC_BREADY),
    .SOC_ARADDR({SOC_ARADDR9, SOC_ARADDR8, SOC_ARADDR7, SOC_ARADDR6, SOC_ARADDR5, SOC_ARADDR4, SOC_ARADDR3, SOC_ARADDR2, SOC_ARADDR1, SOC_ARADDR0}),
    .SOC_ARVALID(SOC_ARVALID),
    .SOC_RREADY(SOC_RREADY),
    .SOC_AWREADY(SOC_AWREADY),
    .SOC_WREADY(SOC_WREADY),
    .SOC_BRESP({SOC_BRESP1, SOC_BRESP0}),
    .SOC_BVALID(SOC_BVALID),
    .SOC_ARREADY(SOC_ARREADY),
    .SOC_RDATA({SOC_RDATA31, SOC_RDATA30, SOC_RDATA29, SOC_RDATA28, SOC_RDATA27, SOC_RDATA26, SOC_RDATA25, SOC_RDATA24, SOC_RDATA23, SOC_RDATA22, SOC_RDATA21, SOC_RDATA20, SOC_RDATA19, SOC_RDATA18, SOC_RDATA17, SOC_RDATA16, SOC_RDATA15, SOC_RDATA14, SOC_RDATA13, SOC_RDATA12, SOC_RDATA11, SOC_RDATA10, SOC_RDATA9, SOC_RDATA8, SOC_RDATA7, SOC_RDATA6, SOC_RDATA5, SOC_RDATA4, SOC_RDATA3, SOC_RDATA2, SOC_RDATA1, SOC_RDATA0}),
    .SOC_RRESP({SOC_RRESP1, SOC_RRESP0}),
    .SOC_RVALID(SOC_RVALID)
);

endmodule