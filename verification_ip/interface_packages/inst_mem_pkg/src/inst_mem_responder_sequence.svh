//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_responder_sequence 
  extends inst_mem_sequence_base ;

  `uvm_object_utils( inst_mem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "inst_mem_responder_sequence");
    super.new(name);
  endfunction

 task reset_registers();
    req=inst_mem_transaction::type_id::create("req");
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hE001;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hE202;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hE403;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hE604;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hE805;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hEa06;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hEc07;
    start_item(req);
    finish_item(req);
    req.instr_dout = 16'hEe08;
    start_item(req);
    finish_item(req);
  endtask

  task body();
    req=inst_mem_transaction::type_id::create("req");
    reset_registers();
    forever begin
      start_item(req);
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_LOW)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

