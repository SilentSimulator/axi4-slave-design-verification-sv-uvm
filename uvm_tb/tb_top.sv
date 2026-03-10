module tb_top;

  import uvm_pkg::*;
  import axi_pkg::*;

  bit clk;
  bit reset;

  always #5 clk = ~clk;

  Axi_if if1(clk,reset);

  Axi_slave dut(if1);

  initial begin
    run_test("axi_test");
  end

endmodule
