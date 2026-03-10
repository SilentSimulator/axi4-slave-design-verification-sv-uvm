class axi_driver extends uvm_driver #(axi_transaction);

  `uvm_component_utils(axi_driver)

  virtual Axi_if vif;

  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction

  task run_phase(uvm_phase phase);

    axi_transaction tr;

    forever begin

      seq_item_port.get_next_item(tr);

      if(tr.write) begin
        vif.AWADDR <= tr.addr;
        vif.WDATA  <= tr.data;
      end

      seq_item_port.item_done();

    end

  endtask
endclass
