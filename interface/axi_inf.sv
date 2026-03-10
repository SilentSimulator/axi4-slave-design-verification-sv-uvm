interface Axi_if #(parameter int ADDR_WIDTH = 32,         //address bus width
                   parameter int DATA_WIDTH = 32,         //data bus width
                   parameter int ID_WIDTH = 4)            //txn id width
  ( input logic Aclk, input logic Aresetn);
  
  //write address channel
  
  logic [ID_WIDTH-1:0] AWID;
  logic [ADDR_WIDTH-1:0] AWADDR;
  logic [7:0] AWLEN;      // # burst length (beats-1)
  logic [2:0] AWSIZE;      // # bytes per transfer
  logic [1:0] AWBURST;    // # burst type (FIXED/INCR/WRAP)
  logic  AWVALID;      // # master indicates address valid
  logic  AWREADY;     // # slave ready to accept address
  
  //write data channel
  logic [DATA_WIDTH-1:0]  WDATA;     // # write data bus
//  logic [STRB_WIDTH-1:0]  WSTRB;     // # byte enable for write data
  logic                   WLAST;     // # last data beat of burst
  logic                   WVALID;    // # data valid from master
  logic                   WREADY;    // # slave ready for data
  
  //write response channel
  logic [ID_WIDTH-1:0] BID;
  logic [1:0] BRESP;
  logic BVALID;
  logic BREADY;
  
  //read address channel
  logic [ID_WIDTH-1:0] ARID;
  logic [ADDR_WIDTH-1:0] ARADDR;
  logic [7:0] ARLEN;
  logic [2:0] ARSIZE;
  logic [1:0] ARBURST;
  logic ARVALID;
  logic ARREADY;
  
 //read data channel
  logic [ID_WIDTH-1:0] RID;
  logic [1:0] RRESP;
  logic [DATA_WIDTH-1:0] RDATA;
  logic RLAST;
  logic RVALID;
  logic RREADY;
  
  
endinterface

  
  
  


  
  
