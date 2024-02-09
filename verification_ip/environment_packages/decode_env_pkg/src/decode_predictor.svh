//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   analysis_export receives transactions of type  decode_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pred_out broadcasts transactions of type decode_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class decode_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( decode_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(decode_in_transaction, decode_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decode_out_transaction) pred_out;
  bit decode;
  int num_txns = 0;
  bit [15:0] prev_IR;
  bit [15:0] prev_npc_out;
  bit [5:0] prev_E_Control;
  bit [1:0] prev_W_Control;
  bit  prev_M_Control;


  // Transaction variable for predicted values to be sent out pred_out
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef decode_out_transaction pred_out_output_transaction_t;
  pred_out_output_transaction_t pred_out_output_transaction;
  pred_out_output_transaction_t container_txn;
  pred_out_output_transaction_t reset_pred_out_output_transaction;
  bit start_xfer = 0;
  bit first_enable_decode_rcvd;
  // Code for sending output transaction out through pred_out
  // pred_out.write(pred_out_output_transaction);

  // Define transaction handles for debug visibility 
  decode_in_transaction analysis_export_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
  //  `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    analysis_export = new("analysis_export", this);
    pred_out =new("pred_out", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(decode_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("pred_out_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    `uvm_info("IMPLEMENTED_PREDICTOR_MODEL", "******************************************************************************************************",UVM_NONE)
    decode = decode_model(t.instr_dout, t.npc_in, pred_out_output_transaction.ir, pred_out_output_transaction.npc_out, 
                        pred_out_output_transaction.e_control, pred_out_output_transaction.w_control, pred_out_output_transaction.m_control);

   if(!start_xfer || first_enable_decode_rcvd == 0)
   begin
     reset_pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("reset_pred_out_output_transaction");
     reset_pred_out_output_transaction.npc_out = 0;
     reset_pred_out_output_transaction.e_control = 0;
     reset_pred_out_output_transaction.w_control = 0;
     reset_pred_out_output_transaction.m_control = 0;
     pred_out.write(reset_pred_out_output_transaction);
     container_txn = pred_out_output_transaction_t::type_id::create("container_txn");
     container_txn = pred_out_output_transaction;
     start_xfer = 1;
   end
  else if (t.enable_decode == 1'b1) 
    begin
      pred_out.write(container_txn);
      container_txn = pred_out_output_transaction_t::type_id::create("container_txn");
      container_txn = pred_out_output_transaction;
    end
  else 
  begin
    container_txn.ir = prev_IR;
    container_txn.npc_out = prev_npc_out;
    container_txn.e_control = prev_E_Control;
    container_txn.w_control = prev_W_Control;
    container_txn.m_control = prev_M_Control;
    pred_out.write(container_txn);
  end

  prev_IR            = container_txn.ir;
  prev_npc_out       = container_txn.npc_out;
  prev_E_Control     = container_txn.e_control;
  prev_W_Control     = container_txn.w_control;
  prev_M_Control     = container_txn.m_control; 

   if(first_enable_decode_rcvd == 0)  
   begin
     first_enable_decode_rcvd = t.enable_decode;
   end
    // Code for sending output transaction out through pred_out
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    // pragma uvmf custom analysis_export_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

