class inst_mem_jump_sequence extends inst_mem_responder_sequence;
    `uvm_object_utils(inst_mem_jump_sequence)
    rand bit [3:0] opcode_r;
    rand bit [2:0] nzp_rand;
    rand bit [8:0] pc_offset9_rand;
    rand bit [2:0] baser_rand;
    function new(string name ="inst_mem_jump_sequence");
        super.new(name);
    endfunction //new()
    static int instr_count = 0;
    task body();
        int data_values[9] = {16'hE000,16'hE000,16'hE200,16'hE400,16'hE600,16'hE800,16'hEA00,16'hEC00,16'hEE00};
        req = inst_mem_transaction::type_id::create("req");
        /*for(int i =0;i<9;i++) begin
            start_item(req);
            //if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_jump_sequence::body()-inst_mem_transaction BR randomization failed")
            req.instr_dout = data_values[i];
            instr_count++;
            finish_item(req);
            $display("INSTRUCTION COUNT = %d",instr_count);    
            `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_LOW)
        end
        for(int i=1; i<8; i++)begin
            for(int j=0; j<512; j++)begin
                start_item(req);
                if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_jump_sequence::body()-inst_mem_transaction BR randomization failed")
                req.instr_dout[15:12] = BR;
                req.instr_dout[11:9]  = i;
                req.instr_dout[8:0]   = j;
                instr_count++;
                finish_item(req);
                `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_LOW)
             end
         end */  
         for(int i=0; i<8; i++)begin
            start_item(req);
            if(!req.randomize()) `uvm_fatal("SEQ", "inst_mem_jump_sequence::body()-inst_mem_transaction JMP randomization failed")
            req.instr_dout[15:12] = JMP;
            req.instr_dout[11:9] = 3'b000;
            req.instr_dout[8:6] = i;
            req.instr_dout[5:0] = 5'b00000;
            instr_count++;
            finish_item(req);
            $display("INSTRUCTION COUNT JMP = %d",instr_count);    
            `uvm_info("INST_MEM_SEQ", $sformatf("Data into Instruction Memory [%x]= %s", req.PC, req.convert2string()), UVM_LOW)
         end     
    endtask
endclass //className extends superClass
