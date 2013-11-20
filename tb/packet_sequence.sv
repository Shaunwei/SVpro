`ifndef PACKET_SEQUENCE__SV
`define PACKET_SEQUENCE__SV

`include "packet.sv"

class packet_sequence extends uvm_sequence #(packet);

  int       item_count = 1;

  `uvm_object_utils_begin(packet_sequence)
    `uvm_field_int(item_count, UVM_ALL_ON)
  `uvm_object_utils_end

  //
  // The valid_da queue must be populated with legal set of addresses as specified
  // by the da_enable field.  Since the first thing that the sequencer performs is
  // the randomization of its default_sequence, a good place to retreive the configuration
  // fields and populate the valid_da queue is in the pre_randomize() method.
  //
  // To simplify your code development, the code is done for you as follows:
  //
  function void pre_randomize();
    uvm_config_db#(int)::get(m_sequencer, "", "item_count", item_count);

  endfunction

  function new(string name = "packet_sequence");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction

  task body();
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
   $value$plusargs("NUM=%d",item_count);
  `uvm_info("ITEM_COUNT", $sformatf("%m  Setting item_count to %d",item_count), UVM_MEDIUM);

    if (starting_phase != null)
      starting_phase.raise_objection(this);

    repeat(item_count) begin


     `uvm_do_with(req,{ 1 == 1; } ); 

    end

    if (starting_phase != null)
      starting_phase.drop_objection(this);
 endtask

endclass

`endif
