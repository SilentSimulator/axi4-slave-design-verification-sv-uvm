module tb;

logic clk;
logic reset;

// clock generation
initial clk = 0;
always #5 clk = ~clk;

// interface
Axi_if if1(clk, reset);

// DUT
Axi_slave dut(if1);

/////////////////////////////////////////////////////
// RESET
/////////////////////////////////////////////////////

initial begin
  reset = 0;
  #20;
  reset = 1;
end

/////////////////////////////////////////////////////
// INITIALIZE SIGNALS
/////////////////////////////////////////////////////

initial begin
  if1.AWVALID = 0;
  if1.WVALID  = 0;
  if1.BREADY  = 0;
  if1.ARVALID = 0;
  if1.RREADY  = 0;
end

/////////////////////////////////////////////////////
// TEST
/////////////////////////////////////////////////////

initial begin

wait(reset);

//////////////////////////////
// WRITE BURST TRANSACTION
//////////////////////////////

// write address
if1.AWADDR  = 10;
if1.AWLEN   = 3;   // 4 transfers
if1.AWVALID = 1;

wait(if1.AWREADY);
@(posedge clk);
if1.AWVALID = 0;


// write data burst
repeat(4) begin

  if1.WDATA  = $random;
  if1.WVALID = 1;

  wait(if1.WREADY);
  @(posedge clk);

end

if1.WVALID = 0;


// wait for write response
if1.BREADY = 1;

wait(if1.BVALID);
@(posedge clk);

if1.BREADY = 0;

$display("WRITE BURST COMPLETED");

#20;

//////////////////////////////
// READ BURST TRANSACTION
//////////////////////////////

if1.ARADDR  = 10;
if1.ARLEN   = 3;  // 4 transfers
if1.ARVALID = 1;

wait(if1.ARREADY);
@(posedge clk);

if1.ARVALID = 0;


// read data
if1.RREADY = 1;

repeat(4) begin

  wait(if1.RVALID);
  $display("Read Data = %h", if1.RDATA);
  @(posedge clk);

end

if1.RREADY = 0;

#50;

$finish;

end

endmodule
