module ram (clk,WRITE0,WRITE1,READ0,READ1,addr_wr0,addr_wr1,addr_rd0,addr_rd1,datain0,datain1,dataout0,dataout1); 
input clk,WRITE0,WRITE1,READ0,READ1; 
input [31:0] addr_wr0,addr_wr1,addr_rd0,addr_rd1;
input [31:0] datain0,datain1; 
output [31:0] dataout0,dataout1; 
reg [31:0] dataout0,dataout1; 
reg [31:0] mem [8*320*320-1:0];  


// Write Port #0
always @(posedge clk) 
  if (READ0) dataout0 <= mem[addr_rd0]; 

// Write Port #1
always @(posedge clk) 
  if (READ1) dataout1 <= mem[addr_rd1]; 

// Read Port #0
always @(posedge clk) 
  if (WRITE0) mem[addr_wr0] <= datain0; 

// Read Port #0
always @(posedge clk) 
  if (WRITE1) mem[addr_wr1] <= datain1; 

endmodule 

