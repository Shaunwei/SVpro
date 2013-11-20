
class packet_rotate extends packet;
  `uvm_object_utils(packet_rotate)

  constraint rotate {
    cmd == ROTATE;
    cmd_data == 10; 
  }

  function new(string name = "packet_rotate");
    super.new(name);
   `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction
endclass

