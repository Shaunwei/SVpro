interface imageproc_io(input bit clk);

   logic  rst_n ;
   logic [3:0] cmd; 
   logic [7:0] cmd_data; 
   logic cmd_valid; 
   logic cmd_ack; 
   logic busy;
   logic refresh;
   logic error; 

   clocking drvClk @(posedge clk);
      output  rst_n;
      output  cmd;
      output  cmd_data;
      output  cmd_valid;
      input   cmd_ack;
      input   busy;
      input   refresh; 
      input   error;
   endclocking: drvClk

   clocking iMonClk @(posedge clk);
      input  busy;
      input  refresh;
   endclocking: iMonClk


   modport driver(clocking drvClk, output rst_n);
   modport imon(clocking iMonClk);
//   modport dut(input clk, reset_n, frame_n, valid_n, din, output dout, busy_n, valido_n, frameo_n);

endinterface: imageproc_io

