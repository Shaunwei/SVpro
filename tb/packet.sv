`ifndef PACKET__SV
`define PACKET__SV

class packet extends uvm_sequence_item;
//typedef enum { ROTATE,ZOOM} cmd_e;
typedef enum { ROTATE,ZOOM,BLACKWHITE,BRIGHTNESS,INVERSION} cmd_e; 

  rand cmd_e  cmd;
  rand bit [3:0] cmd_data;
  

  `uvm_object_utils_begin(packet)
    `uvm_field_enum(cmd_e,cmd, UVM_ALL_ON | UVM_NOCOMPARE)
    `uvm_field_int(cmd_data, UVM_ALL_ON)
  `uvm_object_utils_end

  constraint valid {
    cmd == ROTATE ->  cmd_data inside {[0:20]} ; 
    cmd == ZOOM ->  cmd_data inside {[1:20]} ; 
    cmd == BRIGHTNESS ->  cmd_data inside {[-100:100]} ; 
    cmd == BLACKWHITE ->  cmd_data == 0; 
    cmd == INVERSION ->  cmd_data == 0; 
  }

  function new(string name = "packet");
    super.new(name);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new


endclass: packet
`endif

