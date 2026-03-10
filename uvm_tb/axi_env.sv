class axi_env extends uvm_env;

  `uvm_component_utils(axi_env)

  axi_agent agent;
  axi_scoreboard sb;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  function void build_phase(uvm_phase phase);

    agent = axi_agent::type_id::create("agent",this);
    sb    = axi_scoreboard::type_id::create("sb",this);

  endfunction

endclass
