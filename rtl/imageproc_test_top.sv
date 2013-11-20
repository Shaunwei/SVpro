module imageproc_test_top;
  parameter simulation_cycle = 100 ;
  bit  SystemClock;

  imageproc_io sigs(SystemClock);
  imageproc    dut(
  .clk(sigs.clk), 
  .rst_n(sigs.rst_n),
  .cmd(sigs.cmd),
  .cmd_data(sigs.cmd_data),
  .cmd_valid(sigs.cmd_valid),
  .cmd_ack(sigs.cmd_ack),
  .busy(sigs.busy),
  .refresh(sigs.refresh),
  .error(sigs.error)
  );

  initial begin
    forever #(simulation_cycle/2) SystemClock = ~SystemClock ;
  end
endmodule  
