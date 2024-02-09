class print_component extends uvm_component;
    `uvm_component_utils(print_component)
    `uvm_analysis_imp_decl(_decode_in_aep);
    `uvm_analysis_imp_decl(_decode_out_aep);

    uvm_analysis_imp_decode_in_aep #(decode_in_transaction,print_component) decode_in_aep;
    uvm_analysis_imp_decode_out_aep #(decode_out_transaction,print_component) decode_out_aep;

    function new(string name="print_component", uvm_component parent=null);
        super.new(name,parent);
        decode_in_aep=new("decode_in_aep", this);
        decode_out_aep=new("decode_out_aep", this);
    endfunction 

    virtual function void write_decode_in_aep(decode_in_transaction trans);
        `uvm_info("Decode_in_transaction", {"RECEIVED DECODE_IN_TRANSACTION: ", trans.convert2string()}, UVM_LOW);
         $display(" ");
    endfunction

    virtual function void write_decode_out_aep(decode_out_transaction trans);
        `uvm_info("Decode_out_transaction", {"RECEIVED DECODE_OUT_TRANSACTION: ",trans.convert2string()}, UVM_LOW);
         $display(" ");
    endfunction
endclass
