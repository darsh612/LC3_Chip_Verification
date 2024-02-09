// test_top

class test_top extends uvm_test;

  `uvm_component_utils(test_top)
 
  decode_env_configuration decode_env_cfg;
  decode_environment decode_env;
  decode_in_random_sequence seq;
  print_component p_comp;

  uvmf_sim_level_t sim_level = BLOCK;
  string environment_path = "*";
  string interface_names [] = '{"decode_in_if","decode_out_if"};
  uvm_reg_block register_model = null;
  uvmf_active_passive_t interface_activity[] = {ACTIVE,PASSIVE};
  
  function new(string name="", uvm_component parent = null);
    super.new(name, parent);
  endfunction
 
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    decode_env_cfg = decode_env_configuration::type_id::create("decode_env_configuration");
    decode_env = decode_environment::type_id::create("decode_environment", this);
    decode_env.configuration = this.decode_env_cfg;
    p_comp = print_component::type_id::create("print_component", this);

    decode_env_cfg.initialize(sim_level, environment_path, interface_names, register_model, interface_activity);

  endfunction
 
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq = decode_in_random_sequence::type_id::create("seq", this);

    decode_env_cfg.agent_in_config.wait_for_reset();
    decode_env_cfg.agent_in_config.wait_for_num_clocks(2);
    repeat (25) 
    begin
      decode_env_cfg.initiate_xfer = 1;
      seq.start(decode_env.agent_in.sequencer);
    end
    decode_env_cfg.agent_in_config.wait_for_num_clocks(1);
    phase.drop_objection(this);
  endtask

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase

endclass
