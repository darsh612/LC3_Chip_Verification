class inst_mem_load_sequence extends inst_mem_responder_sequence;
  `uvm_object_utils(inst_mem_load_sequence)

  function new(string name="");
    super.new(name);
  endfunction

  static int instr_count = 0;
  int i = 0;
  int j = 0;
  int k = 0;
  logic [2:0] dr = 3'b0;
  logic [2:0] br = 3'b0;
  logic [8:0] pc_offset_9 = 9'b0;
  logic [5:0] pc_offset_6 = 6'b0;
  inst_mem_transaction req;

  task ld_transfer();
    req = inst_mem_transaction::type_id::create("req");
    for(i= 0; i<8; i++)
    begin
      for( j =0; j<512; j++) 
      begin
        start_item(req);
        if(!req.randomize()) `uvm_fatal("LOAD_SEQ", "inst_mem_load_sequence randomization failed")
        req.instr_dout[15:12] = 4'b0010;
        req.instr_dout[11:9]  = dr;
        req.instr_dout[8:0]   = pc_offset_9;
        pc_offset_9 = pc_offset_9 + 9'h1;
        instr_count++;
        finish_item(req);
      end
      dr = dr + 3'h1;
    end
    dr = '0;
    pc_offset_9 = '0;
  endtask

   task ldr_transfer();
     req = inst_mem_transaction::type_id::create("req");
     for(i=0; i<8; i++) begin
       for( j=0; j<8; j++) begin
         for( k=0; k<64; k++) begin
           start_item(req);
           if(!req.randomize()) `uvm_fatal("LOAD_SEQ", "inst_mem_load_sequence randomization failed")
           req.instr_dout[15:12] = 4'b0110;
           req.instr_dout[11:9]  = dr;
           req.instr_dout[8:6]   = br;
           req.instr_dout[5:0]   = pc_offset_6;
           pc_offset_6 = pc_offset_6 + 6'h1;
           instr_count++;
           finish_item(req);
         end
         br = br + 3'h1;
       end
       dr = dr + 3'h1;
     end

     dr = '0;
     br = '0;
     pc_offset_6 = '0;
     pc_offset_9 = '0;
   endtask

  task ldi_transfer();
    req = inst_mem_transaction::type_id::create("req");
    for(i= 0; i<8; i++) begin
      for( j =0; j<512; j++) begin
        start_item(req);
        if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_load_sequence::body()-inst_mem_transaction randomization failed")
        req.instr_dout[15:12] = 4'b1010;
        req.instr_dout[11:9]  = dr;
        req.instr_dout[8:0]   = pc_offset_9;
        pc_offset_9 = pc_offset_9 + 9'h1;
        instr_count++;
        finish_item(req);
        $display("INSTRUCTION COUNT 3= %d",instr_count);    
        `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_LOW)
      end
      dr = dr + 3'h1;
    end

    dr = '0;
    br = '0;
    pc_offset_6 = '0;
    pc_offset_9 = '0;
  endtask

  task lea_transfer();
    req = inst_mem_transaction::type_id::create("req");
    for(i= 0; i<8; i++) begin
      for( j =0; j<512; j++) begin
        start_item(req);
        if(!req.randomize()) `uvm_fatal("LOAD_SEQ", "inst_mem_load_sequence randomization failed")
        req.instr_dout[15:12] = 4'b1110;
        req.instr_dout[11:9]  = dr;
        req.instr_dout[8:0]   = pc_offset_9;
        pc_offset_9 = pc_offset_9 + 9'h1;
        instr_count++;
        finish_item(req);
        end
      dr = dr + 3'h1;
    end
  endtask

  task body();
    reset_registers();
    req = inst_mem_transaction::type_id::create("req");
    ld_transfer();
    ldr_transfer();
    ldi_transfer();
    lea_transfer();

    forever begin
      start_item(req);
      if(!req.randomize()) 
        `uvm_fatal("LOAD_SEQ", "inst_mem_load_sequence randomization failed")
      finish_item(req);
    end
  endtask
endclass
