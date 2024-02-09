 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_agent_fetch_in }
wave add uvm_test_top.environment.fetch.agent_fetch_in.agent_fetch_in_monitor.txn_stream -radix string -tag F0
wave group fetch_agent_fetch_in_bus
wave add -group fetch_agent_fetch_in_bus hdl_top.fetch_agent_fetch_in_bus.* -radix hexadecimal -tag F0
wave group fetch_agent_fetch_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_agent_fetch_out }
wave add uvm_test_top.environment.fetch.agent_fetch_out.agent_fetch_out_monitor.txn_stream -radix string -tag F0
wave group fetch_agent_fetch_out_bus
wave add -group fetch_agent_fetch_out_bus hdl_top.fetch_agent_fetch_out_bus.* -radix hexadecimal -tag F0
wave group fetch_agent_fetch_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_agent_in }
wave add uvm_test_top.environment.decode.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group decode_agent_in_bus
wave add -group decode_agent_in_bus hdl_top.decode_agent_in_bus.* -radix hexadecimal -tag F0
wave group decode_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_agent_out }
wave add uvm_test_top.environment.decode.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group decode_agent_out_bus
wave add -group decode_agent_out_bus hdl_top.decode_agent_out_bus.* -radix hexadecimal -tag F0
wave group decode_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_agent_in }
wave add uvm_test_top.environment.control.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group control_agent_in_bus
wave add -group control_agent_in_bus hdl_top.control_agent_in_bus.* -radix hexadecimal -tag F0
wave group control_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { control_agent_out }
wave add uvm_test_top.environment.control.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group control_agent_out_bus
wave add -group control_agent_out_bus hdl_top.control_agent_out_bus.* -radix hexadecimal -tag F0
wave group control_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_agent_in }
wave add uvm_test_top.environment.execute.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group execute_agent_in_bus
wave add -group execute_agent_in_bus hdl_top.execute_agent_in_bus.* -radix hexadecimal -tag F0
wave group execute_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_agent_out }
wave add uvm_test_top.environment.execute.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group execute_agent_out_bus
wave add -group execute_agent_out_bus hdl_top.execute_agent_out_bus.* -radix hexadecimal -tag F0
wave group execute_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_agent_in }
wave add uvm_test_top.environment.memaccess.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group memaccess_agent_in_bus
wave add -group memaccess_agent_in_bus hdl_top.memaccess_agent_in_bus.* -radix hexadecimal -tag F0
wave group memaccess_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_agent_out }
wave add uvm_test_top.environment.memaccess.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group memaccess_agent_out_bus
wave add -group memaccess_agent_out_bus hdl_top.memaccess_agent_out_bus.* -radix hexadecimal -tag F0
wave group memaccess_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_agent_in }
wave add uvm_test_top.environment.writeback.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group writeback_agent_in_bus
wave add -group writeback_agent_in_bus hdl_top.writeback_agent_in_bus.* -radix hexadecimal -tag F0
wave group writeback_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_agent_out }
wave add uvm_test_top.environment.writeback.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group writeback_agent_out_bus
wave add -group writeback_agent_out_bus hdl_top.writeback_agent_out_bus.* -radix hexadecimal -tag F0
wave group writeback_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { inst_mem }
wave add uvm_test_top.environment.inst_mem.inst_mem_monitor.txn_stream -radix string -tag F0
wave group inst_mem_bus
wave add -group inst_mem_bus hdl_top.inst_mem_bus.* -radix hexadecimal -tag F0
wave group inst_mem_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { data_mem }
wave add uvm_test_top.environment.data_mem.data_mem_monitor.txn_stream -radix string -tag F0
wave group data_mem_bus
wave add -group data_mem_bus hdl_top.data_mem_bus.* -radix hexadecimal -tag F0
wave group data_mem_bus -collapse
wave insertion [expr [wave index insertpoint] +1]

wave update on
WaveSetStreamView

