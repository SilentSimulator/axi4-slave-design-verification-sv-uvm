class axi_test extends uvm_test;

  `uvm_component_utils(axi_test)

  axi_env env;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    env = axi_env::type_id::create("env",this);

  endfunction

endclass
