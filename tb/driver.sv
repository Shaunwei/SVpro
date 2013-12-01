`ifndef DRIVER__SV
`define DRIVER__SV

import "DPI" function void gen_image (input reg [31:0]  x[8*320*320-1:0] ); 

class driver extends uvm_driver #(packet);
  virtual imageproc_io sigs;          // DUT virtual interface


  `uvm_component_utils_begin(driver)
  `uvm_component_utils_end


  function new(string name, uvm_component parent);
    super.new(name, parent);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  endfunction: new


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    uvm_config_db#(virtual imageproc_io)::get(this, "", "imageproc_io", sigs);
    if (sigs == null) begin
      `uvm_fatal("CFGERR", "Interface for Driver not set");
    end

  endfunction: build_phase


  //
  // The UVM start_of_simulation phase is designed for displaying the testbench configuration
  // before any active verification operation starts.
  //
  // For the sake of lab time, the start_of_simulation method is done for you.
  //
  virtual function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
  //  `uvm_info("DRV_CFG", $sformatf("port_id is: %0d", port_id), UVM_MEDIUM);
  endfunction: start_of_simulation_phase


  virtual task run_phase(uvm_phase phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);

    forever begin
      seq_item_port.get_next_item(req);
        send(req);
        `uvm_info("DRV_RUN", {"\n", req.sprint()}, UVM_MEDIUM);


      seq_item_port.item_done();
    end
  endtask: run_phase


  virtual task pre_reset_phase(uvm_phase phase);
    super.pre_reset_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    phase.raise_objection(this);
    
      sigs.drvClk.cmd_valid <= '0; 
     sigs.drvClk.cmd <= 'x; 
     sigs.drvClk.cmd_data <= 'x; 

    phase.drop_objection(this);
  endtask: pre_reset_phase

  virtual task reset_phase(uvm_phase phase);
    super.reset_phase(phase);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
    phase.raise_objection(this);

      sigs.drvClk.cmd_valid <= '0; 
     sigs.drvClk.cmd <= 'x; 
     sigs.drvClk.cmd_data <= 'x; 

    phase.drop_objection(this);
  endtask: reset_phase


  virtual task send(packet tr);
    `uvm_info("TRACE", $sformatf("%m"), UVM_HIGH);
     `uvm_info("DRV_RUN", "Loading image from mem.image!!", UVM_MEDIUM);
     $readmemh("mem.image",imageproc_test_top.dut.ram.mem); 

     if (sigs.drvClk.busy !==0) 
          `uvm_fatal("DRV_RUN", $sformatf("Chip is too busy  !!")); 
     sigs.drvClk.cmd_valid <= '1;
     sigs.drvClk.cmd <= req.cmd; 
     sigs.drvClk.cmd_data <= req.cmd_data; 
     @(sigs.drvClk); 
     sigs.drvClk.cmd_valid <= '0;
     sigs.drvClk.cmd <= 'x; 
     sigs.drvClk.cmd_data <= 'x; 
    `uvm_info("DRV_RUN", $sformatf("Sending packet"), UVM_MEDIUM);
     @(sigs.drvClk); 
     if (sigs.drvClk.error == 1) 
          `uvm_info("DRV_RUN", $sformatf("Command not supported!"), UVM_MEDIUM);
     fork 
        wait (sigs.drvClk.refresh == 1); 
        begin
          repeat (5000000) @(sigs.drvClk); 
          `uvm_fatal("DRV_RUN", $sformatf("Did not received a refresh signal within 500000 cycles!!")); 
        end
     join_any
     if (sigs.drvClk.refresh==1)  begin 
          `uvm_info("DRV_RUN", $sformatf("Displaying image"), UVM_MEDIUM);
       gen_image(imageproc_test_top.dut.ram.mem); 
     end
     @(sigs.drvClk); 
     @(sigs.drvClk); 
        
  endtask: send

endclass: driver

`endif
