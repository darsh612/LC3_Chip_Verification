onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hdl_top/decode_in_if_bus/clock
add wave -noupdate /hdl_top/decode_in_if_bus/reset
add wave -noupdate /hdl_top/decode_in_if_bus/enable_decode
add wave -noupdate /hdl_top/decode_in_if_bus/instr_dout
add wave -noupdate /hdl_top/decode_in_if_bus/npc_in
add wave -noupdate /hdl_top/decode_out_if_bus/clock
add wave -noupdate /hdl_top/decode_out_if_bus/reset
add wave -noupdate /hdl_top/decode_out_if_bus/ir
add wave -noupdate /hdl_top/decode_out_if_bus/npc_out
add wave -noupdate /hdl_top/decode_out_if_bus/e_control
add wave -noupdate /hdl_top/decode_out_if_bus/w_control
add wave -noupdate /hdl_top/decode_out_if_bus/m_control
add wave -noupdate /uvm_root/uvm_test_top/decode_environment/agent_out/agent_out_monitor/txn_stream
add wave -noupdate /uvm_root/uvm_test_top/decode_environment/agent_in/agent_in_monitor/txn_stream
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {135 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 311
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
WaveRestoreZoom {107 ns} {323 ns}
