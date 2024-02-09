//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
  //fetch
  tri enable_updatePC;
  tri enable_fetch;
  tri [15:0] taddr;
  tri br_taken;
  tri [15:0] npc;
  tri [15:0] pc;
  tri instrmem_rd;
 
  //decode
  tri  enable_decode;
  tri [15:0] instr_dout;
  tri [15:0] npc_in;
  tri [15:0] ir;
  tri [15:0] npc_out;
  tri [5:0] e_control;
  tri [1:0] w_control;
  tri  m_control;
 
  //inst_mem
  tri [15:0] PC;
  tri  complete_instr;

  //data_mem
  tri  complete_data;
  tri [15:0] Data_dout;
  tri [15:0] Data_din;
  tri  Data_rd;
  tri [15:0] Data_addr;

  //execute
  tri  enable_execute;
  tri [5:0] E_control;
  tri  bypass_alu_1;
  tri  bypass_alu_2;
  tri  bypass_mem_1;
  tri  bypass_mem_2;
  tri [15:0] IR;
  tri  Mem_Control_in;
  tri [1:0] W_Control_in;
  tri [15:0] VSR1;
  tri [15:0] VSR2;
  tri [15:0] Mem_Bypass_Val;

  tri [15:0] aluout;
  tri [1:0] W_Control_out;
  tri  Mem_Control_out;
  tri [15:0] M_Data;
  tri [2:0] dr;
  tri [2:0] sr1;
  tri [2:0] sr2;
  tri [15:0] pcout;
  tri [15:0] IR_Exec;
  tri [2:0] NZP;

  //memaccess
  tri [1:0] mem_state;
  tri  M_Control;
  tri [15:0] M_addr;
  tri [15:0] DMem_dout;

  tri [15:0] DMem_addr;  
  tri [15:0] Dmem_din;
  tri [15:0] DMem_rd;
  tri [15:0] memout;

  //control
  tri [2:0] psr;
  tri [15:0] IMem_dout;

  tri  enable_writeback;

  //writeback
  tri [1:0] W_control_in;

  // pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #5ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #22ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetch_agent_fetch_in_bus(
     // pragma uvmf custom fetch_agent_fetch_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .enable_updatePC(dut_verilog.enable_updatePC),
     .enable_fetch(dut_verilog.enable_fetch),
     .taddr(dut_verilog.taddr),
     .br_taken(dut_verilog.br_taken)
     // pragma uvmf custom fetch_agent_fetch_in_bus_connections end
     );

  fetch_out_if  fetch_agent_fetch_out_bus(
     // pragma uvmf custom fetch_agent_fetch_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .npc(dut_verilog.npc_out_fetch),
     .pc(dut_verilog.pc),
     .instrmem_rd(dut_verilog.instrmem_rd)
     // pragma uvmf custom fetch_agent_fetch_out_bus_connections end
     );

  decode_in_if  decode_agent_in_bus(
     // pragma uvmf custom decode_agent_in_bus_connections begin
     .clock(clk),
     .reset(rst),
     .enable_decode(dut_verilog.enable_decode),
     .instr_dout(dut_verilog.Instr_dout),
     .npc_in(dut_verilog.npc_out_fetch)
     // pragma uvmf custom decode_agent_in_bus_connections end
     );

  decode_out_if  decode_agent_out_bus(
     // pragma uvmf custom decode_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .ir(dut_verilog.IR),
     .npc_out(dut_verilog.npc_out_dec),
     .e_control(dut_verilog.E_Control),
     .w_control(dut_verilog.W_Control),
     .m_control(dut_verilog.Mem_Control)
     // pragma uvmf custom decode_agent_out_bus_connections end
     );

  control_in_if  control_agent_in_bus(
     // pragma uvmf custom control_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .complete_data(dut_verilog.complete_data),
     .complete_instr(dut_verilog.complete_instr),
     .IR(dut_verilog.IR),
     .psr(dut_verilog.psr),
     .IR_Exec(dut_verilog.IR_Exec),
     .IMem_dout(dut_verilog.Instr_dout),
     .NZP(dut_verilog.NZP)
 
     // pragma uvmf custom control_agent_in_bus_connections end
     );

  control_out_if  control_agent_out_bus(
     // pragma uvmf custom control_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .enable_updatePC(dut_verilog.enable_updatePC),
     .enable_fetch(dut_verilog.enable_fetch),
     .enable_decode(dut_verilog.enable_decode),
     .enable_execute(dut_verilog.enable_execute),
     .enable_writeback(dut_verilog.enable_writeback),
     .bypass_alu_1(dut_verilog.bypass_alu_1),
     .bypass_alu_2(dut_verilog.bypass_alu_2),
     .bypass_mem_1(dut_verilog.bypass_mem_1),
     .bypass_mem_2(dut_verilog.bypass_mem_2),
     .mem_state(dut_verilog.mem_state),
     .br_taken(dut_verilog.br_taken)
     // pragma uvmf custom control_agent_out_bus_connections end
     );

  execute_in_if  execute_agent_in_bus(
     // pragma uvmf custom execute_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .enable_execute(dut_verilog.enable_execute),
     .E_control(dut_verilog.E_Control),
     .bypass_alu_1(dut_verilog.bypass_alu_1),
     .bypass_alu_2(dut_verilog.bypass_alu_2),
     .bypass_mem_1(dut_verilog.bypass_mem_1),
     .bypass_mem_2(dut_verilog.bypass_mem_2),
     .IR(dut_verilog.IR),
     .npc_in(dut_verilog.npc_out_dec),
     .Mem_Control_in(dut_verilog.Mem_Control),
     .W_Control_in(dut_verilog.W_Control),
     .VSR1(dut_verilog.VSR1),
     .VSR2(dut_verilog.VSR2),
     .Mem_Bypass_Val(dut_verilog.memout)
     // pragma uvmf custom execute_agent_in_bus_connections end
     );

  execute_out_if  execute_agent_out_bus(
     // pragma uvmf custom execute_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .aluout(dut_verilog.aluout),
     .W_Control_out(dut_verilog.W_Control_out),
     .Mem_Control_out(dut_verilog.Mem_Control_out),
     .M_Data(dut_verilog.M_Data),
     .dr(dut_verilog.dr),
     .sr1(dut_verilog.sr1),
     .sr2(dut_verilog.sr2),
     .pcout(dut_verilog.pcout),
     .IR_Exec(dut_verilog.IR_Exec),
     .NZP(dut_verilog.NZP)
     // pragma uvmf custom execute_agent_out_bus_connections end
     );

  memaccess_in_if  memaccess_agent_in_bus(
     // pragma uvmf custom memaccess_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .mem_state(dut_verilog.mem_state),
     .M_Control(dut_verilog.Mem_Control_out),// #FIXME:AAR
     .M_Data(dut_verilog.M_Data),
     .M_addr(dut_verilog.pcout),
     .DMem_dout(dut_verilog.Data_dout)
     // pragma uvmf custom memaccess_agent_in_bus_connections end
     );

  memaccess_out_if  memaccess_agent_out_bus(
     // pragma uvmf custom memaccess_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .DMem_addr(dut_verilog.Data_addr),
     .Dmem_din(dut_verilog.Data_din),
     .DMem_rd(dut_verilog.Data_rd),
     .memout(dut_verilog.memout)
     // pragma uvmf custom memaccess_agent_out_bus_connections end
     );

  writeback_in_if  writeback_agent_in_bus(
     // pragma uvmf custom writeback_agent_in_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .enable_writeback(dut_verilog.enable_writeback),
     .npc(dut_verilog.npc_out_dec),
     .W_control_in(dut_verilog.W_Control_out),
     .aluout(dut_verilog.aluout),
     .pcout(dut_verilog.pcout),
     .memout(dut_verilog.memout),
     .sr1(dut_verilog.sr1),
     .sr2(dut_verilog.sr2),
     .dr(dut_verilog.dr)
     // pragma uvmf custom writeback_agent_in_bus_connections end
     );

  writeback_out_if  writeback_agent_out_bus(
     // pragma uvmf custom writeback_agent_out_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .VSR1(dut_verilog.VSR1),
     .VSR2(dut_verilog.VSR2),
     .psr(dut_verilog.psr),
     .enable_writeback(dut_verilog.enable_writeback)
     // pragma uvmf custom writeback_agent_out_bus_connections end
     );

  inst_mem_if  inst_mem_bus(
     // pragma uvmf custom inst_mem_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .PC(dut_verilog.pc),
     .instrmem_rd(dut_verilog.instrmem_rd),
     .instr_dout(dut_verilog.Instr_dout),
     .complete_instr(dut_verilog.complete_instr)
     // pragma uvmf custom inst_mem_bus_connections end
     );

  data_mem_if  data_mem_bus(
     // pragma uvmf custom data_mem_bus_connections begin
     .clock(clk), 
     .reset(rst),
     .complete_data(dut_verilog.complete_data),
     .Data_dout(dut_verilog.Data_dout),
     .Data_din(dut_verilog.Data_din),
     .Data_rd(dut_verilog.Data_rd),
     .Data_addr(dut_verilog.Data_addr)
     // pragma uvmf custom data_mem_bus_connections end
     );

  fetch_in_monitor_bfm  fetch_agent_fetch_in_mon_bfm(fetch_agent_fetch_in_bus.monitor_port);
  fetch_out_monitor_bfm  fetch_agent_fetch_out_mon_bfm(fetch_agent_fetch_out_bus.monitor_port);
  decode_in_monitor_bfm  decode_agent_in_mon_bfm(decode_agent_in_bus.monitor_port);
  decode_out_monitor_bfm  decode_agent_out_mon_bfm(decode_agent_out_bus.monitor_port);
  control_in_monitor_bfm  control_agent_in_mon_bfm(control_agent_in_bus.monitor_port);
  control_out_monitor_bfm  control_agent_out_mon_bfm(control_agent_out_bus.monitor_port);
  execute_in_monitor_bfm  execute_agent_in_mon_bfm(execute_agent_in_bus.monitor_port);
  execute_out_monitor_bfm  execute_agent_out_mon_bfm(execute_agent_out_bus.monitor_port);
  memaccess_in_monitor_bfm  memaccess_agent_in_mon_bfm(memaccess_agent_in_bus.monitor_port);
  memaccess_out_monitor_bfm  memaccess_agent_out_mon_bfm(memaccess_agent_out_bus.monitor_port);
  writeback_in_monitor_bfm  writeback_agent_in_mon_bfm(writeback_agent_in_bus.monitor_port);
  writeback_out_monitor_bfm  writeback_agent_out_mon_bfm(writeback_agent_out_bus.monitor_port);
  inst_mem_monitor_bfm  inst_mem_mon_bfm(inst_mem_bus.monitor_port);
  data_mem_monitor_bfm  data_mem_mon_bfm(data_mem_bus.monitor_port);
  inst_mem_driver_bfm  inst_mem_drv_bfm(inst_mem_bus.responder_port);
  data_mem_driver_bfm  data_mem_drv_bfm(data_mem_bus.responder_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
  LC3         dut_verilog(   .clock(clk), .reset(rst), .pc(inst_mem_bus.PC), .instrmem_rd(inst_mem_bus.instrmem_rd), .Instr_dout(inst_mem_bus.instr_dout), .Data_addr(data_mem_bus.Data_addr), .complete_instr(inst_mem_bus.complete_instr), .complete_data(data_mem_bus.complete_data), .Data_din(data_mem_bus.Data_din), .Data_dout(data_mem_bus.Data_dout), .Data_rd(data_mem_bus.Data_rd));
  
  // pragma uvmf custom dut_instantiation end

  // Fetch Block: interface connections with RTL
//assign fetch_agent_fetch_in_bus.enable_updatePC = dut_verilog.enable_updatePC;
//assign fetch_agent_fetch_in_bus.enable_fetch    = dut_verilog.enable_fetch;
//assign fetch_agent_fetch_in_bus.taddr           = dut_verilog.taddr;
//assign fetch_agent_fetch_in_bus.br_taken        = dut_verilog.br_taken;
//assign fetch_agent_fetch_out_bus.npc            = dut_verilog.npc_out_fetch;
//assign fetch_agent_fetch_out_bus.pc             = dut_verilog.pc;
//assign fetch_agent_fetch_out_bus.instrmem_rd    = dut_verilog.instrmem_rd;

//// Decode Block: interface connections with RTL
//assign decode_agent_in_bus.enable_decode = dut_verilog.enable_decode;
//assign decode_agent_in_bus.instr_dout    = dut_verilog.Instr_dout;
//assign decode_agent_in_bus.npc_in        = dut_verilog.npc_out_fetch;
//assign decode_agent_out_bus.m_control    = dut_verilog.Mem_Control;
//assign decode_agent_out_bus.e_control    = dut_verilog.E_Control;
//assign decode_agent_out_bus.w_control    = dut_verilog.W_Control;
//assign decode_agent_out_bus.ir           = dut_verilog.IR;
//assign decode_agent_out_bus.npc_out      = dut_verilog.npc_out_dec;

// Execute Block: interface connections with RTL
//assign execute_agent_in_bus.E_control      = dut_verilog.E_Control;
//assign execute_agent_in_bus.IR             = dut_verilog.IR;
//assign execute_agent_in_bus.npc_in         = dut_verilog.npc_out_dec;
//assign execute_agent_in_bus.bypass_alu_1   = dut_verilog.bypass_alu_1;
//assign execute_agent_in_bus.bypass_alu_2   = dut_verilog.bypass_alu_2;
//assign execute_agent_in_bus.bypass_mem_1   = dut_verilog.bypass_mem_1;
//assign execute_agent_in_bus.bypass_mem_2   = dut_verilog.bypass_mem_2;
//assign execute_agent_in_bus.VSR1           = dut_verilog.VSR1;
//assign execute_agent_in_bus.VSR2           = dut_verilog.VSR2;
//assign execute_agent_in_bus.W_Control_in   = dut_verilog.W_Control;
//assign execute_agent_in_bus.Mem_Control_in = dut_verilog.Mem_Control;
//assign execute_agent_in_bus.enable_execute = dut_verilog.enable_execute;
//assign execute_agent_in_bus.Mem_Bypass_Val = dut_verilog.memout;

//assign execute_agent_out_bus.W_Control_out   = dut_verilog.W_Control_out;
//assign execute_agent_out_bus.Mem_Control_out = dut_verilog.Mem_Control_out;
//assign execute_agent_out_bus.aluout          = dut_verilog.aluout;
//assign execute_agent_out_bus.pcout           = dut_verilog.pcout;
//assign execute_agent_out_bus.dr              = dut_verilog.dr;
//assign execute_agent_out_bus.sr1             = dut_verilog.sr1;
//assign execute_agent_out_bus.sr2             = dut_verilog.sr2;
//assign execute_agent_out_bus.IR_Exec         = dut_verilog.IR_Exec;
//assign execute_agent_out_bus.NZP             = dut_verilog.NZP;
//assign execute_agent_out_bus.M_Data          = dut_verilog.M_Data;

//// Control Block: interface connections with RTL
//assign control_agent_in_bus.complete_data  = dut_verilog.complete_data;
//assign control_agent_in_bus.complete_instr = dut_verilog.complete_instr;
//assign control_agent_in_bus.IR             = dut_verilog.IR;
//assign control_agent_in_bus.psr            = dut_verilog.psr;
//assign control_agent_in_bus.IR_Exec = dut_verilog.IR_Exec;
//assign control_agent_in_bus.IMem_dout = dut_verilog.Instr_dout;
//assign control_agent_in_bus.NZP = dut_verilog.NZP;
//assign control_agent_out_bus.enable_updatePC = dut_verilog.enable_updatePC;
//assign control_agent_out_bus.enable_fetch = dut_verilog.enable_fetch;
//assign control_agent_out_bus.enable_decode = dut_verilog.enable_decode;
//assign control_agent_out_bus.enable_execute = dut_verilog.enable_execute;
//assign control_agent_out_bus.enable_writeback = dut_verilog.enable_writeback;
//assign control_agent_out_bus.bypass_alu_1 = dut_verilog.bypass_alu_1;
//assign control_agent_out_bus.bypass_alu_2 = dut_verilog.bypass_alu_2;
//assign control_agent_out_bus.bypass_mem_1 = dut_verilog.bypass_mem_1;
//assign control_agent_out_bus.bypass_mem_2 = dut_verilog.bypass_mem_2;
//assign control_agent_out_bus.mem_state = dut_verilog.mem_state;
//assign control_agent_out_bus.br_taken = dut_verilog.br_taken;

//// Memaccess Block: interface connections with RTL
//assign memaccess_agent_in_bus.mem_state  = dut_verilog.mem_state;
//assign memaccess_agent_in_bus.M_Control  = dut_verilog.Mem_Control_out;
//assign memaccess_agent_in_bus.M_Data     = dut_verilog.M_Data;
//assign memaccess_agent_in_bus.M_addr     = dut_verilog.pcout;
//assign memaccess_agent_in_bus.DMem_dout  = dut_verilog.Data_dout;
//assign memaccess_agent_out_bus.DMem_addr = dut_verilog.Data_addr;
//assign memaccess_agent_out_bus.Dmem_din  = dut_verilog.Data_din;
//assign memaccess_agent_out_bus.DMem_rd   = dut_verilog.Data_rd;
//assign memaccess_agent_out_bus.memout    = dut_verilog.memout;

//// Writeback Block: interface connections with RTL
//assign writeback_agent_in_bus.enable_writeback = dut_verilog.enable_writeback;
//assign writeback_agent_in_bus.aluout           = dut_verilog.aluout;
//assign writeback_agent_in_bus.memout           = dut_verilog.memout;
//assign writeback_agent_in_bus.sr1              = dut_verilog.sr1;
//assign writeback_agent_in_bus.sr2              = dut_verilog.sr2;
//assign writeback_agent_in_bus.dr               = dut_verilog.dr;
//assign writeback_agent_in_bus.npc              = dut_verilog.npc_out_dec;
//assign writeback_agent_in_bus.pcout            = dut_verilog.pcout;
//assign writeback_agent_in_bus.W_control_in     = dut_verilog.W_Control_out;
//assign writeback_agent_out_bus.psr             = dut_verilog.psr;
//assign writeback_agent_out_bus.VSR1            = dut_verilog.VSR1;
//assign writeback_agent_out_bus.VSR2            = dut_verilog.VSR2;

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_agent_fetch_in_BFM , fetch_agent_fetch_in_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_agent_fetch_out_BFM , fetch_agent_fetch_out_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_agent_in_BFM , decode_agent_in_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_agent_out_BFM , decode_agent_out_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_agent_in_BFM , control_agent_in_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , control_agent_out_BFM , control_agent_out_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_agent_in_BFM , execute_agent_in_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_agent_out_BFM , execute_agent_out_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_agent_in_BFM , memaccess_agent_in_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_agent_out_BFM , memaccess_agent_out_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_agent_in_BFM , writeback_agent_in_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_agent_out_BFM , writeback_agent_out_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_BFM , inst_mem_mon_bfm ); 
    uvm_config_db #( virtual data_mem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_BFM , data_mem_mon_bfm ); 
    uvm_config_db #( virtual inst_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , inst_mem_BFM , inst_mem_drv_bfm  );
    uvm_config_db #( virtual data_mem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , data_mem_BFM , data_mem_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

