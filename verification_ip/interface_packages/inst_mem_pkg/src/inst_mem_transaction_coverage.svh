//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records inst_mem transaction information using
//       a covergroup named inst_mem_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class inst_mem_transaction_coverage  extends uvm_subscriber #(.T(inst_mem_transaction ));

  `uvm_component_utils( inst_mem_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
    parameter ADDX = 4'b0001;
    parameter ANDX = 4'b0101;
    parameter NOTX = 4'b1001;
    parameter LDX =  4'b0010;
    parameter LDRX = 4'b0110;
    parameter LDIX = 4'b1010;
    parameter LEAX = 4'b1110;
    parameter STX =  4'b0011;
    parameter STRX = 4'b0111;
    parameter STIX = 4'b1011;
    parameter BRX =  4'b0000;
    parameter JMPX = 4'b1100;
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup alu_instr_cg;
    alu_instr_opcode: coverpoint coverage_trans.instr_dout[15:12]{
      bins ADD_op = {4'h1};
      bins AND_op = {4'h5};
      bins NOT_op = {4'h9};
    }
    alu_sr1: coverpoint coverage_trans.instr_dout[8:6]{
      bins valid_sr1[] = {0,1,2,3,4,5,6,7};
    }
    alu_sr2: coverpoint coverage_trans.instr_dout[2:0]{
      bins valid_sr2[] = {0,1,2,3,4,5,6,7};
    }
    alu_dr: coverpoint coverage_trans.instr_dout[11:9]{
      bins valid_dr[] = {0,1,2,3,4,5,6,7};
    }
    alu_imm: coverpoint coverage_trans.instr_dout[4:0] {
      bins valid_imm5 = {[5'b11111:5'b10000]};
      bins valid_imm4 = {[5'b01111:5'b01000]};
      bins valid_imm3 = {[5'b00111:5'b00100]};
      bins valid_imm2 = {[5'b00011:5'b00010]};
      bins valid_imm1 = {[5'b00001:5'b00000]};
    }
    alu_and_add_cp : coverpoint coverage_trans.instr_dout[15:12]{
                bins ADD = {4'h1};
                bins AND = {4'h5};
              }
    alu_opcode_X_sr1_X_sr2: cross alu_and_add_cp,alu_sr1,alu_sr2 ;
    alu_opcode_X_sr1_X_imm: cross alu_and_add_cp,alu_sr1,alu_imm ;
  endgroup


  covergroup mem_inst_cg;
    opcode_mem: coverpoint coverage_trans.instr_dout[15:12]{
      bins LD_op  = {4'h2};
      bins LDR_op = {4'h6};
      bins LDI_op = {4'ha};
      bins LEA_op = {4'he};
      bins ST_op  = {4'h3};
      bins STR_op = {4'h7};
      bins STI_op = {4'hb};
    }
    baser_mem: coverpoint coverage_trans.instr_dout[8:6] {
      bins valid_mbr[] = {0,1,2,3,4,5,6,7};
    }
    dreg_mem: coverpoint coverage_trans.instr_dout[11:9] 
                                                         
                                                         
                                                         
    {
      bins valid_mdr[] = {0,1,2,3,4,5,6,7};
    }
    pcoffset6_mem:  coverpoint  coverage_trans.instr_dout[5:0] {
      bins pcoffset6_5 = {[6'b111111:6'b100000]};
      bins pcoffset6_4 = {[6'b011111:6'b010000]};
      bins pcoffset6_3 = {[6'b001111:6'b001000]};
      bins pcoffset6_2 = {[6'b000111:6'b000000]};
    }
    pcoffset9_mem:  coverpoint  coverage_trans.instr_dout[8:0] 
                                                               
                                                               
                                                               
                                                               
    {
      bins pcoffset9_8 = {[9'b111111111:9'b100000000]};
      bins pcoffset9_7 = {[9'b011111111:9'b010000000]};
      bins pcoffset9_6 = {[9'b001111111:9'b001000000]};
      bins pcoffset9_5 = {[9'b000111111:9'b000100000]};
      bins pcoffset9_4 = {[9'b000011111:9'b000010000]};
      bins pcoffset9_3 = {[9'b000001111:9'b000001000]};
      bins pcoffset9_2 = {[9'b000000111:9'b000000000]};
    }
  endgroup

  covergroup control_inst_cg;
    opcode_cntrl: coverpoint coverage_trans.instr_dout[15:12]{
      bins br_op = {0};
      bins jmp_op = {4'hc};
    }
    pcoffset_cntrl: coverpoint coverage_trans.instr_dout[8:0] {
      bins control_pcoffset9_8 = {[9'b111111111:9'b100000000]};
      bins control_pcoffset9_7 = {[9'b011111111:9'b010000000]};
      bins control_pcoffset9_6 = {[9'b001111111:9'b001000000]};
      bins control_pcoffset9_5 = {[9'b000111111:9'b000100000]};
      bins control_pcoffset9_4 = {[9'b000011111:9'b000010000]};
      bins control_pcoffset9_3 = {[9'b000001111:9'b000001000]};
      bins control_pcoffset9_2 = {[9'b000000111:9'b000000000]};
    }
    baser_cntrl: coverpoint coverage_trans.instr_dout[8:6] {
      bins control_baser[] = {[0:7]};
    }
    nzp_cntrl: coverpoint coverage_trans.instr_dout[11:9] {
      ignore_bins control_nzp = {3'b000};
    }
  endgroup

  covergroup imem_txn_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    imem_pc: coverpoint coverage_trans.PC{
      option.auto_bin_max=64;
      bins PCmax = {[16'h3000:$]};
    }
    instrmem_rd: coverpoint coverage_trans.instrmem_rd;
    // pragma uvmf custom covergroup end
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    imem_txn_cg=new;
    alu_instr_cg=new;
    mem_inst_cg=new;
    control_inst_cg=new;
    // `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    imem_txn_cg.set_inst_name($sformatf("inst_mem_transaction_cg_%s",get_full_name()));
    alu_instr_cg.set_inst_name($sformatf("alu_instr_cg%s",get_full_name()));
    mem_inst_cg.set_inst_name($sformatf("mem_inst_cg%s",get_full_name()));
    control_inst_cg.set_inst_name($sformatf("control_inst_cg%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;
    imem_txn_cg.sample();
    alu_instr_cg.sample();
    mem_inst_cg.sample();
    control_inst_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end
