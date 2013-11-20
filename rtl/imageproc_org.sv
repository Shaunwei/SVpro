module imageproc(
input clk,
input rst_n,
input [3:0] cmd, 
input [7:0] cmd_data, 
input cmd_valid, 
output cmd_ack, 
output busy,
output refresh,
output error
); 
reg refresh;
reg busy=0; 
/// Instantiation of memory
/// TODO: hook up ports of memory to your design!
ram ram(); 


/// TODO : complete code below!!

endmodule


