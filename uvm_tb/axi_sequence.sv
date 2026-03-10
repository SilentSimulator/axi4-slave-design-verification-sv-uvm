class axi_sequence extends uvm_sequence #(axi_transaction);

  `uvm_object_utils(axi_sequence)

  function new(string name="axi_sequence");
    super.new(name);
  endfunction

  task body();
    axi_transaction tr;

    repeat(5) begin
      tr = axi_transaction::type_id::create("tr");
      start_item(tr);
      assert(tr.randomize());
      finish_item(tr);
    end
  endtask

endclass
