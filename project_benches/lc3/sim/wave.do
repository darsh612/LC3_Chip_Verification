onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider fetch_agent_fetch_in
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/clock
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/reset
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/enable_updatePC
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/enable_fetch
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/taddr
add wave -noupdate -group fetch_agent_fetch_in_bus /hdl_top/fetch_agent_fetch_in_bus/br_taken
add wave -noupdate -divider fetch_agent_fetch_out
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/clock
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/reset
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/npc
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/pc
add wave -noupdate -group fetch_agent_fetch_out_bus /hdl_top/fetch_agent_fetch_out_bus/instrmem_rd
add wave -noupdate -divider decode_agent_in
add wave -noupdate -group decode_agent_in_bus /hdl_top/decode_agent_in_bus/clock
add wave -noupdate -group decode_agent_in_bus /hdl_top/decode_agent_in_bus/reset
add wave -noupdate -group decode_agent_in_bus /hdl_top/decode_agent_in_bus/enable_decode
add wave -noupdate -group decode_agent_in_bus /hdl_top/decode_agent_in_bus/instr_dout
add wave -noupdate -group decode_agent_in_bus /hdl_top/decode_agent_in_bus/npc_in
add wave -noupdate -divider decode_agent_out
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/clock
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/reset
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/ir
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/npc_out
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/e_control
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/w_control
add wave -noupdate -group decode_agent_out_bus /hdl_top/decode_agent_out_bus/m_control
add wave -noupdate -divider control_agent_in
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/clock
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/reset
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/complete_data
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/complete_instr
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/IR
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/psr
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/IR_Exec
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/IMem_dout
add wave -noupdate -group control_agent_in_bus /hdl_top/control_agent_in_bus/NZP
add wave -noupdate -divider control_agent_out
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/clock
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/reset
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/enable_updatePC
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/enable_fetch
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/enable_decode
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/enable_execute
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/enable_writeback
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/bypass_alu_1
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/bypass_alu_2
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/bypass_mem_1
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/bypass_mem_2
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/mem_state
add wave -noupdate -group control_agent_out_bus /hdl_top/control_agent_out_bus/br_taken
add wave -noupdate -divider execute_agent_in
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/clock
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/reset
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/enable_execute
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/E_control
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/bypass_alu_1
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/bypass_alu_2
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/bypass_mem_1
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/bypass_mem_2
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/IR
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/npc_in
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/Mem_Control_in
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/W_Control_in
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/VSR1
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/VSR2
add wave -noupdate -group execute_agent_in_bus /hdl_top/execute_agent_in_bus/Mem_Bypass_Val
add wave -noupdate -divider execute_agent_out
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/clock
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/reset
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/aluout
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/W_Control_out
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/Mem_Control_out
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/M_Data
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/dr
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/sr1
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/sr2
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/pcout
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/IR_Exec
add wave -noupdate -group execute_agent_out_bus /hdl_top/execute_agent_out_bus/NZP
add wave -noupdate -divider memaccess_agent_in
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/clock
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/reset
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/mem_state
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/M_Control
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/M_Data
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/M_addr
add wave -noupdate -group memaccess_agent_in_bus /hdl_top/memaccess_agent_in_bus/DMem_dout
add wave -noupdate -divider memaccess_agent_out
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/clock
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/reset
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/DMem_addr
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/Dmem_din
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/DMem_rd
add wave -noupdate -group memaccess_agent_out_bus /hdl_top/memaccess_agent_out_bus/memout
add wave -noupdate -divider writeback_agent_in
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/clock
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/reset
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/enable_writeback
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/npc
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/W_control_in
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/aluout
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/pcout
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/memout
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/sr1
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/sr2
add wave -noupdate -group writeback_agent_in_bus /hdl_top/writeback_agent_in_bus/dr
add wave -noupdate -divider writeback_agent_out
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/clock
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/reset
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/VSR1
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/VSR2
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/psr
add wave -noupdate -group writeback_agent_out_bus /hdl_top/writeback_agent_out_bus/enable_writeback
add wave -noupdate -divider inst_mem
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/clock
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/reset
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/PC
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/instrmem_rd
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/instr_dout
add wave -noupdate -group inst_mem_bus /hdl_top/inst_mem_bus/complete_instr
add wave -noupdate -divider data_mem
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/clock
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/reset
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/complete_data
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/Data_dout
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/Data_din
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/Data_rd
add wave -noupdate -group data_mem_bus /hdl_top/data_mem_bus/Data_addr
add wave -noupdate /hdl_top/dut_verilog/clock
add wave -noupdate /hdl_top/dut_verilog/reset
add wave -noupdate /hdl_top/dut_verilog/complete_instr
add wave -noupdate /hdl_top/dut_verilog/complete_data
add wave -noupdate /hdl_top/dut_verilog/pc
add wave -noupdate /hdl_top/dut_verilog/Data_addr
add wave -noupdate /hdl_top/dut_verilog/instrmem_rd
add wave -noupdate /hdl_top/dut_verilog/Data_rd
add wave -noupdate /hdl_top/dut_verilog/Instr_dout
add wave -noupdate /hdl_top/dut_verilog/Data_dout
add wave -noupdate /hdl_top/dut_verilog/Data_din
add wave -noupdate /hdl_top/dut_verilog/enable_updatePC
add wave -noupdate /hdl_top/dut_verilog/br_taken
add wave -noupdate /hdl_top/dut_verilog/enable_decode
add wave -noupdate /hdl_top/dut_verilog/enable_execute
add wave -noupdate /hdl_top/dut_verilog/enable_writeback
add wave -noupdate /hdl_top/dut_verilog/enable_fetch
add wave -noupdate /hdl_top/dut_verilog/npc_out_fetch
add wave -noupdate /hdl_top/dut_verilog/taddr
add wave -noupdate /hdl_top/dut_verilog/IR
add wave -noupdate /hdl_top/dut_verilog/IR_Exec
add wave -noupdate /hdl_top/dut_verilog/npc_out_dec
add wave -noupdate /hdl_top/dut_verilog/E_Control
add wave -noupdate /hdl_top/dut_verilog/W_Control
add wave -noupdate /hdl_top/dut_verilog/Mem_Control
add wave -noupdate /hdl_top/dut_verilog/bypass_alu_1
add wave -noupdate /hdl_top/dut_verilog/bypass_alu_2
add wave -noupdate /hdl_top/dut_verilog/bypass_mem_1
add wave -noupdate /hdl_top/dut_verilog/bypass_mem_2
add wave -noupdate /hdl_top/dut_verilog/VSR1
add wave -noupdate /hdl_top/dut_verilog/VSR2
add wave -noupdate /hdl_top/dut_verilog/aluout
add wave -noupdate /hdl_top/dut_verilog/pcout
add wave -noupdate /hdl_top/dut_verilog/psr
add wave -noupdate /hdl_top/dut_verilog/W_Control_out
add wave -noupdate /hdl_top/dut_verilog/Mem_Control_out
add wave -noupdate /hdl_top/dut_verilog/sr1
add wave -noupdate /hdl_top/dut_verilog/sr2
add wave -noupdate /hdl_top/dut_verilog/dr
add wave -noupdate /hdl_top/dut_verilog/NZP
add wave -noupdate /hdl_top/dut_verilog/mem_state
add wave -noupdate /hdl_top/dut_verilog/M_Control
add wave -noupdate /hdl_top/dut_verilog/M_Data
add wave -noupdate /hdl_top/dut_verilog/memout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {266 ns}
