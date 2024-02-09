module hdl_top();

  import uvm_pkg::*;
  import uvmf_base_pkg_hdl::*;
  import uvmf_base_pkg::*;
  import decode_test_pkg::*;
  `include "uvm_macros.svh"
  
  bit clk;
  bit rst;
  wire [15:0] npc_in;
  wire en_decode;
  wire [15:0] instr_dout;
  wire psr;
  wire [1:0] w_control;
  wire m_control;
  wire [5:0] e_control;
  wire [15:0] ir;
  wire [15:0] npc_out;

// ****************************************************************************
// Clock generator
  initial begin : clk_gen
    clk = 0;
    forever
      #5 clk = ~clk;
  end

// ****************************************************************************
// Reset generator
  initial begin : rst_gen
    rst = 1'b1;
    #113 rst = 1'b0;
  end

  decode_in_if decode_in_if_bus(.clock(clk), .reset(rst), .enable_decode(en_decode), .instr_dout(instr_dout), .npc_in(npc_in));
  decode_in_monitor_bfm monitor_in_bfm(decode_in_if_bus);
  decode_in_driver_bfm driver_in_bfm(decode_in_if_bus);

  decode_out_if decode_out_if_bus(.clock(clk),.reset(rst),.e_control(e_control), .w_control(w_control), .npc_out(npc_out), .ir(ir), .m_control(m_control));
  decode_out_monitor_bfm monitor_out_bfm(decode_out_if_bus);
  decode_out_driver_bfm driver_out_bfm(decode_out_if_bus);

  Decode decode_rtl(
    .clock(clk), 
    .reset(rst), 
    .enable_decode(en_decode), 
    .dout(instr_dout), 
    .npc_in(npc_in), 
    .E_Control(e_control),
    .W_Control(w_control), 
    .npc_out(npc_out), 
    .IR(ir), 
    .Mem_Control(m_control));

  initial begin
    uvm_config_db#(virtual decode_in_driver_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_in_if", driver_in_bfm);
    uvm_config_db#(virtual decode_in_monitor_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_in_if", monitor_in_bfm);
    uvm_config_db#(virtual decode_out_driver_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_out_if", driver_out_bfm);
    uvm_config_db#(virtual decode_out_monitor_bfm)::set(null, UVMF_VIRTUAL_INTERFACES, "decode_out_if", monitor_out_bfm);
  end

endmodule

