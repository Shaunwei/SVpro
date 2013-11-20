// Note
// this is the example from class
// we are just going to remove the green component from each pixel
// 
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

reg WRITE0,WRITE1,READ0,READ1;
reg  [31:0] addr_wr0,addr_wr1,addr_rd0,addr_rd1;
reg [31:0] datain0,datain1;
wire  [31:0] dataout0,dataout1;

ram ram(clk,WRITE0,WRITE1,READ0,READ1,addr_wr0,addr_wr1,addr_rd0,addr_rd1,datain0,datain1,dataout0,dataout1);
reg data_valid,data_valid2,data_valid3,data_valid4;
reg [63:0] data,data2,data3,data4;
reg [4:0] state;

reg refresh;
reg busy=0; 

//initial refresh=0; 

always @(*) begin
 refresh = (addr_wr1==99999) ; 

end









read_mem read_orig(clk,rst_n,!cmd_valid,READ0,addr_rd0,dataout0,data,data_valid); 
compute_xy  #(1) compute_xy   (clk,data,data_valid, data2,data_valid2); 
write_mem write_orig  (clk,data2,data_valid2,WRITE1,addr_wr1, datain1); 

endmodule



module write_mem(input clk, input [63:0] data, input valid, output reg WRITE, output reg [31:0] addr, output reg [31:0] datain); parameter OFFSET = 0; wire [8:0] x,y; assign x = data [49:41]; assign y = data[40:32]; always @(posedge clk) 
   WRITE <= valid;
always @(posedge clk)
  // addr <= data[41:24]; 
     addr <= OFFSET | (x + y*320) ;
always @(posedge clk)
   datain <= data [23:0]; 


endmodule


module compute_xy (input clk, input [63:0] data, input data_valid, output reg [63:0] data2, output reg data_valid2); parameter ERROR=0; // { x,y, datain }
 always @(posedge clk) begin
  data2[63:42] <= 0;    // UNUSED
  data2[49:32] <= data[49:32];   // X,Y value
  data2[7:0] <= data[7:0];   // blue
  if (ERROR==1) 
    data2[15:8] <= 0;// data[15:8];   // Green
  else
    data2[15:8] <=  data[15:8];  // Green

  data2[23:16] <= data[23:16];  //   Red
  data2[31:24] <= 0;
end
always @(posedge clk)
  data_valid2 <= data_valid; 

endmodule
module  read_mem(input clk,rst_n,valid_n, output reg READ,output reg [31:0] addr, input [31:0] datain, output reg [63:0] data, output reg data_valid); parameter OFFSET = 0; reg [31:0] index; reg [8:0] x,y; reg [3:0] state; reg [3:0] cycles; always @(posedge clk,negedge rst_n)  if (!rst_n) begin 
   index<=0; 
   state <= 0; 
   READ <= 0; 
   data_valid <= 0;
 end
 else
 case (state)
   0: begin 
      index<=0; x<=0; y<=0; index<=0; 
      if (!valid_n) state <= 1; 
   end
   1: begin 
      state <= 2; 
      READ <= 1; 
      addr <= OFFSET | index; 
   end
   2: begin 
      READ <= 0; 
      state <= 3; 
   end
   3: begin 
      data <=  {  x,y, datain } ;
      data_valid <= 1'b1; 
      state <= 4; 
   end
   4: begin 
      index <= index + 1; 
      x <= (x==319) ? 0 : x+1; 
      y <= (x==319) ? y+1 : y;  
      data_valid <= 1'b0; 
      if (index == 320*320-1) state <= 0; 
      else state <= 1'b1; 
   end
 endcase

endmodule

