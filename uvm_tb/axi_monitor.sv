class axi_monitor extends uvm_monitor;

  `uvm_component_utils(axi_monitor)

  virtual Axi_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

endclass
