var g_data = {"154":{"cvpc":[{"h":["Data_din",4,1,155],"cov":[1,1,100.00],"opts":{"goal":"100"}},{"h":["Data_rd",4,1,156],"cov":[2,2,100.00],"opts":{"goal":"100"}},{"h":["Data_dout",4,1,157],"cov":[1,1,100.00],"opts":{"goal":"100"}},{"h":["complete_data",4,1,158],"cov":[2,2,100.00],"opts":{"goal":"100"}}],"159":{"cvpc":[{"h":["Data_din",4,1,160],"cov":[1,1,100.00],"opts":{"goal":"100","auto_bin_max":"1024"}},{"h":["Data_rd",4,1,161],"cov":[2,2,100.00],"opts":{"goal":"100","auto_bin_max":"1024"}},{"h":["Data_dout",4,1,162],"cov":[1,1,100.00],"opts":{"goal":"100","auto_bin_max":"1024"}},{"h":["complete_data",4,1,163],"cov":[2,2,100.00],"opts":{"goal":"100","auto_bin_max":"1024"}}],"cvg":["dmem_txn_cguvm_test_top.environment.data_mem.data_mem_coverage",2],"cvgdata":[6,6,0,0]},"cvg":["/data_mem_pkg/data_mem_transaction_coverage/dmem_txn_cg",1],"cvgdata":[6,6,0,0]},"166":{"cvpc":[{"h":["alu_instr_opcode",4,1,167],"cov":[3,3,100.00],"opts":{"goal":"100"}},{"h":["alu_sr1",4,1,168],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["alu_sr2",4,1,169],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["alu_dr",4,1,170],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["alu_imm",4,1,171],"cov":[5,5,100.00],"opts":{"goal":"100"}},{"h":["alu_and_add_cp",4,1,172],"cov":[2,2,100.00],"opts":{"goal":"100"}},{"h":["alu_opcode_X_sr1_X_sr2",8,1,173],"cov":[128,128,100.00],"opts":{"goal":"100"},"cvps":["alu_and_add_cp","alu_sr1","alu_sr2"]},{"h":["alu_opcode_X_sr1_X_imm",8,1,174],"cov":[80,80,100.00],"opts":{"goal":"100"},"cvps":["alu_and_add_cp","alu_sr1","alu_imm"]}],"cvg":["/inst_mem_pkg/inst_mem_transaction_coverage/alu_instr_cg",1],"cvgdata":[34,34,208,208]},"175":{"cvpc":[{"h":["opcode_mem",4,1,176],"cov":[7,5,71.42],"opts":{"goal":"100"}},{"h":["baser_mem",4,1,177],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["dreg_mem",4,1,178],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["pcoffset6_mem",4,1,179],"cov":[4,4,100.00],"opts":{"goal":"100"}},{"h":["pcoffset9_mem",4,1,180],"cov":[7,7,100.00],"opts":{"goal":"100"}}],"cvg":["/inst_mem_pkg/inst_mem_transaction_coverage/mem_inst_cg",1],"cvgdata":[34,32,0,0]},"181":{"cvpc":[{"h":["opcode_cntrl",4,1,182],"cov":[2,2,100.00],"opts":{"goal":"100"}},{"h":["pcoffset_cntrl",4,1,183],"cov":[7,7,100.00],"opts":{"goal":"100"}},{"h":["baser_cntrl",4,1,184],"cov":[8,8,100.00],"opts":{"goal":"100"}},{"h":["nzp_cntrl",4,1,185],"cov":[7,7,100.00],"opts":{"goal":"100"}}],"cvg":["/inst_mem_pkg/inst_mem_transaction_coverage/control_inst_cg",1],"cvgdata":[24,24,0,0]},"186":{"cvpc":[{"h":["imem_pc",4,1,187],"cov":[1,1,100.00],"opts":{"goal":"100"}},{"h":["instrmem_rd",4,1,188],"cov":[2,2,100.00],"opts":{"goal":"100"}}],"189":{"cvpc":[{"h":["imem_pc",4,1,190],"cov":[1,1,100.00],"opts":{"goal":"100"}},{"h":["instrmem_rd",4,1,191],"cov":[2,2,100.00],"opts":{"goal":"100","auto_bin_max":"1024"}}],"cvg":["inst_mem_transaction_cg_uvm_test_top.environment.inst_mem.inst_mem_coverage",2],"cvgdata":[3,3,0,0]},"cvg":["/inst_mem_pkg/inst_mem_transaction_coverage/imem_txn_cg",1],"cvgdata":[3,3,0,0]}};
processCoverpointsData(g_data);