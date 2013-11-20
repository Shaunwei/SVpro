
class packet_zoom extends packet;
  `uvm_object_utils(packet_zoom)

  constraint rotate {
    cmd == ZOOM;
    cmd_data == 2; 
  }

  function new(string name = "packet_zoom");
    super.new(name);
   `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction
endclass

