class branch_test extends test_top;

  `uvm_component_utils( branch_test );

  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

  virtual function void build_phase(uvm_phase phase);
    // The factory override below replaces the lc3_bench_sequence_base 
    // sequence with the register_test_sequence.
    // Execute the build_phase of test_top AFTER all factory overrides have been created.
    super.build_phase(phase);
    inst_mem_responder_sequence::type_id::set_type_override(inst_mem_branch_sequence::get_type());
  endfunction

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

