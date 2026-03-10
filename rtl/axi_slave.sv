`include "interface_axi.sv"
module Axi_slave #(
  parameter ADDR_WIDTH = 8,
  parameter DATA_WIDTH = 32,
  parameter DEPTH = 256
)
(
  Axi_if if1
);

logic [DATA_WIDTH-1:0] mem [0:DEPTH-1];

logic [ADDR_WIDTH-1:0] waddr;
logic [ADDR_WIDTH-1:0] raddr;

logic [7:0] wburst_cnt;
logic [7:0] rburst_cnt;

//////////////////////////////////////////////////
// WRITE CHANNEL
//////////////////////////////////////////////////

always_ff @(posedge if1.Aclk or negedge if1.Aresetn) begin

  if(!if1.Aresetn) begin
    if1.AWREADY <= 0;
    if1.WREADY  <= 0;
    if1.BVALID  <= 0;
  end

  else begin

    if1.AWREADY <= 1;
    if1.WREADY  <= 1;

    // capture write address and burst length
    if(if1.AWVALID && if1.AWREADY) begin
      waddr       <= if1.AWADDR;
      wburst_cnt  <= if1.AWLEN;
    end

    // write burst data
    if(if1.WVALID && if1.WREADY) begin

      mem[waddr] <= if1.WDATA;
      waddr      <= waddr + 1;

      if(wburst_cnt == 0) begin
        if1.BVALID <= 1;
      end
      else begin
        wburst_cnt <= wburst_cnt - 1;
      end

    end

    if(if1.BVALID && if1.BREADY)
      if1.BVALID <= 0;

  end
end

//////////////////////////////////////////////////
// READ CHANNEL
//////////////////////////////////////////////////

always_ff @(posedge if1.Aclk or negedge if1.Aresetn) begin

  if(!if1.Aresetn) begin
    if1.ARREADY <= 0;
    if1.RVALID  <= 0;
  end

  else begin

    if1.ARREADY <= 1;

    // capture read address
    if(if1.ARVALID && if1.ARREADY) begin

      raddr      <= if1.ARADDR;
      rburst_cnt <= if1.ARLEN;

      if1.RDATA  <= mem[if1.ARADDR];
      if1.RVALID <= 1;

    end

    else if(if1.RVALID && if1.RREADY) begin

      if(rburst_cnt > 0) begin

        raddr <= raddr + 1;
        rburst_cnt <= rburst_cnt - 1;

        if1.RDATA <= mem[raddr + 1];

      end
      else begin
        if1.RVALID <= 0;
      end

    end

  end

end

endmodule
