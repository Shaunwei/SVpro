/*********************************************************************\
Verilog Project: UVM based image processor

Function: 0 = ROTATE
          1 = ZOOM
          2 = BLACKWHITE
          3 = INVERSION
 
\*********************************************************************/


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
reg data_valid,data_valid2,data_valid3,data_valid4,data_valid5,data_valid6,data_valid7;
reg [63:0] data,data2,data3,data4,data5,data6,data7;
reg [4:0] state;
//reg refresh;
//reg busy=0; 

//cmd module
   reg [6:0] cmd_d;
   reg [1:0] cmd_m;
   reg 	     cmd_v;
   reg 	     cmd_s;
   
   
   assign cmd_ack = cmd_v?1:0;
   assign error = cmd_s?0:1;
   assign refresh = (addr_wr1==102399)?1:0;
   assign busy =0;
   
initial
  begin
     //cmd_d =0;
     //cmd_m =0;
     cmd_v =0;
     cmd_s =1;
  end
   
   
always @(*) begin
   if(cmd_valid==1 && cmd<4 && cmd_data<=90 && cmd_data>=0)begin
      cmd_m <= cmd;
      cmd_d <= cmd_data;
      cmd_v<=1;
   end
   else if(cmd_valid==1)
     cmd_s <=0;
   
end

 
   
//always @(*) refresh = (addr_wr1==102399) ;  

   

always @(*) begin
  case(cmd_m)
    2'b00 : begin
       //rotate
       data2 <= data4;
       data_valid2 <= data_valid4;
       cmd_d <= cmd_data;
    end
    
    2'b01 : begin
       //zoom
       data2 <= data5;
       data_valid2 <= data_valid5;
       if (cmd_data>= 1 && cmd_data<=10) cmd_d <=cmd_data;
       else cmd_v<=0;
       end
    
    2'b10 : begin
       //blackwhite
       data2 <= data6;
       data_valid2 <= data_valid6;
    end
 
    2'b11 : begin
       //inversion
       data2 <= data7;
       data_valid2 <= data_valid7;
    end         
  endcase // case (cmd_m)
end // always @ (*)


   
   





read_mem read_orig(clk,rst_n,!cmd_valid,READ0,addr_rd0,dataout0,data,data_valid); 
grayscale  grayscale_orig   (clk,data,data_valid, data6,data_valid6);//6 
rotate rotate_orig (clk,data,data_valid, data4,data_valid4,cmd_d);//4
zoom  zoom_orig (clk,data,data_valid, data5,data_valid5,cmd_d);//5
inversion  inversion_orig (clk,data,data_valid, data7,data_valid7);//7
write_mem #(131072) write_tmp  (clk,data2,data_valid2,WRITE0,addr_wr0, datain0);
read_mem #(131072) read_tmp (clk,rst_n,(addr_rd0!=102399),READ1,addr_rd1,dataout1,data3,data_valid3);
write_mem write_orig  (clk,data3,data_valid3,WRITE1,addr_wr1, datain1); 

endmodule


//write and read modules

module write_mem(input clk, 
		 input [63:0] data, 
		 input valid, 
		 output reg WRITE, 
		 output reg [31:0] addr, 
		 output reg [31:0] datain); 
   parameter OFFSET = 0; 
   wire [8:0] x,y; 
   
   assign x = (data [49:41]<320)?data[49:41]:0; 
   assign y = (data[40:32]<320)?data[40:32]:0;
   
   always @(posedge clk) 
     WRITE <= valid;
   always @(posedge clk)
     addr <= ((x + y*320)+OFFSET) ;
   always @(posedge clk)
     datain <= data [23:0]; 
endmodule

module  read_mem(input clk,rst_n,valid_n, 
		 output reg READ,
		 output reg [31:0] addr, 
		 input [31:0] datain, 
		 output reg [63:0] data, 
		 output reg data_valid); 
   parameter OFFSET = 0; 
   reg [31:0] index; 
   reg [8:0]  x,y; 
   reg [3:0]  state; 
   reg [3:0]  cycles; 

   always @(posedge clk,negedge rst_n)  
     if (!rst_n) begin 
	index<=0; 
	state <= 0; 
	READ <= 0; 
	data_valid <= 0;
     end
     else
       case (state)
	 0: begin 
	    index<=0; x<=0; y<=0;           
	    if (!valid_n) state <= 1; 
	 end
	 1: begin 
	    state <= 2; 
	    READ <= 1; 
	    addr <= ( index+OFFSET);
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


//functional modules

//cmd = 0, ROTATE
module rotate (input clk, 
	       input [63:0] data, 
	       input data_valid, 
	       output reg [63:0] data2, 
	       output reg data_valid2,
	       input [6:0] angle);
   
  // parameter ERROR=0;
  // parameter ANGLE=10;
   wire [6:0] sin, cos;
   
   sintable sin_cos(clk, angle,sin,cos); 
   
   always @(posedge clk) begin
      data2[49:41] <= ( cos*(data[49:41]-160) + sin*(data[40:32]-160))/64 +160;
      data2[40:32] <= (-sin*(data[49:41]-160) + cos*(data[40:32]-160))/64 +160;
      end
   
   always @(posedge clk)begin
     data_valid2 <= data_valid;
     data2[15:8] <= data[15:8];   // Green
     data2[7:0] <= data[7:0];   // blue
     data2[23:16] <= data[23:16];  //   Red
     data2[63:50] <=0;
     data2[31:24] <=0; 
     end
endmodule // rotate

      


//cmd=1 ZOOM
module zoom (input clk, 
	     input [63:0] data, 
	     input data_valid, 
	     output reg [63:0] data2, 
	     output reg data_valid2,
	     input [6:0] zoom);
  // parameter ERROR=0;
  // parameter ZOOM=10;
         
   always @(posedge clk) begin
      data2[49:41] <= (data[49:41]-160)/zoom+160;
      data2[40:32] <= (data[40:32]-160)/zoom+160;
      end
   
   always @(posedge clk)begin
     data_valid2 <= data_valid;
     data2[15:8] <= data[15:8];   // Green
     data2[7:0] <= data[7:0];   // blue
     data2[23:16] <= data[23:16];  //   Red
     data2[63:50] <=0;
     data2[31:24] <=0; 
     end
endmodule // rotate


//cmd=2 GRAYSCALE
module grayscale (input clk, 
		  input [63:0] data, 
		  input data_valid, 
		  output reg [63:0] data2, 
		  output reg data_valid2); 
   
   reg [8:0] tmp;
   
   always @(posedge clk) begin
      data2[63:42] <= 0;    // UNUSED
      data2[49:32] <= data[49:32];   // X,Y value
      tmp[8:0] <= (data[23:16]+ data[15:8] + data[7:0])/3;
      data2[31:24] <= 0;  //UNUSED
      data2[15:8] <= tmp[7:0];   // Green
      data2[7:0] <= tmp[7:0];   // blue
      data2[23:16] <= tmp[7:0];  //   Red
   end     
   
   always @(posedge clk)
     data_valid2 <= data_valid; 
endmodule // grayscale



//cmd=3 INVERSION
module inversion (input clk, 
		  input [63:0] data, 
		  input data_valid, 
		  output reg [63:0] data2, 
		  output reg data_valid2); 
   
   //parameter ERROR=0; // { x,y, datain }
      
   always @(posedge clk) begin
      data2[63:42] <= 0;    // UNUSED
      data2[49:32] <= data[49:32];   // X,Y value
      data2[31:24] <= 0;  //UNUSED
      data2[15:8]  <= 255-data[15:8];   // Green
      data2[7:0]   <= 255-data[7:0];   // blue
      data2[23:16] <= 255-data[23:16];  //   Red
      end
   always @(posedge clk)
     data_valid2 <= data_valid; 
endmodule // grayscale










module sintable(input clk,
		input [6:0] angle, 
		output reg [6:0]sin,cos);
   always@(posedge clk) begin
      
case(angle)
0:begin
 sin<=0;
 cos<=64;
 end
1:begin
 sin<=1;
 cos<=64;
 end
2:begin
 sin<=2;
 cos<=64;
 end
3:begin
 sin<=3;
 cos<=64;
 end
4:begin
 sin<=4;
 cos<=64;
 end
5:begin
 sin<=6;
 cos<=64;
 end
6:begin
 sin<=7;
 cos<=64;
 end
7:begin
 sin<=8;
 cos<=64;
 end
8:begin
 sin<=9;
 cos<=63;
 end
9:begin
 sin<=10;
 cos<=63;
 end
10:begin
 sin<=11;
 cos<=63;
 end
11:begin
 sin<=12;
 cos<=63;
 end
12:begin
 sin<=13;
 cos<=63;
 end
13:begin
 sin<=14;
 cos<=62;
 end
14:begin
 sin<=15;
 cos<=62;
 end
15:begin
 sin<=17;
 cos<=62;
 end
16:begin
 sin<=18;
 cos<=62;
 end
17:begin
 sin<=19;
 cos<=61;
 end
18:begin
 sin<=20;
 cos<=61;
 end
19:begin
 sin<=21;
 cos<=61;
 end
20:begin
 sin<=22;
 cos<=60;
 end
21:begin
 sin<=23;
 cos<=60;
 end
22:begin
 sin<=24;
 cos<=59;
 end
23:begin
 sin<=25;
 cos<=59;
 end
24:begin
 sin<=26;
 cos<=58;
 end
25:begin
 sin<=27;
 cos<=58;
 end
26:begin
 sin<=28;
 cos<=58;
 end
27:begin
 sin<=29;
 cos<=57;
 end
28:begin
 sin<=30;
 cos<=57;
 end
29:begin
 sin<=31;
 cos<=56;
 end
30:begin
 sin<=32;
 cos<=55;
 end
31:begin
 sin<=33;
 cos<=55;
 end
32:begin
 sin<=34;
 cos<=54;
 end
33:begin
 sin<=35;
 cos<=54;
 end
34:begin
 sin<=36;
 cos<=53;
 end
35:begin
 sin<=37;
 cos<=52;
 end
36:begin
 sin<=38;
 cos<=52;
 end
37:begin
 sin<=39;
 cos<=51;
 end
38:begin
 sin<=39;
 cos<=50;
 end
39:begin
 sin<=40;
 cos<=50;
 end
40:begin
 sin<=41;
 cos<=49;
 end
41:begin
 sin<=42;
 cos<=48;
 end
42:begin
 sin<=43;
 cos<=48;
 end
43:begin
 sin<=44;
 cos<=47;
 end
44:begin
 sin<=44;
 cos<=46;
 end
45:begin
 sin<=45;
 cos<=45;
 end
46:begin
 sin<=46;
 cos<=44;
 end
47:begin
 sin<=47;
 cos<=44;
 end
48:begin
 sin<=48;
 cos<=43;
 end
49:begin
 sin<=48;
 cos<=42;
 end
50:begin
 sin<=49;
 cos<=41;
 end
51:begin
 sin<=50;
 cos<=40;
 end
52:begin
 sin<=50;
 cos<=39;
 end
53:begin
 sin<=51;
 cos<=39;
 end
54:begin
 sin<=52;
 cos<=38;
 end
55:begin
 sin<=52;
 cos<=37;
 end
56:begin
 sin<=53;
 cos<=36;
 end
57:begin
 sin<=54;
 cos<=35;
 end
58:begin
 sin<=54;
 cos<=34;
 end
59:begin
 sin<=55;
 cos<=33;
 end
60:begin
 sin<=55;
 cos<=32;
 end
61:begin
 sin<=56;
 cos<=31;
 end
62:begin
 sin<=57;
 cos<=30;
 end
63:begin
 sin<=57;
 cos<=29;
 end
64:begin
 sin<=58;
 cos<=28;
 end
65:begin
 sin<=58;
 cos<=27;
 end
66:begin
 sin<=58;
 cos<=26;
 end
67:begin
 sin<=59;
 cos<=25;
 end
68:begin
 sin<=59;
 cos<=24;
 end
69:begin
 sin<=60;
 cos<=23;
 end
70:begin
 sin<=60;
 cos<=22;
 end
71:begin
 sin<=61;
 cos<=21;
 end
72:begin
 sin<=61;
 cos<=20;
 end
73:begin
 sin<=61;
 cos<=19;
 end
74:begin
 sin<=62;
 cos<=18;
 end
75:begin
 sin<=62;
 cos<=17;
 end
76:begin
 sin<=62;
 cos<=15;
 end
77:begin
 sin<=62;
 cos<=14;
 end
78:begin
 sin<=63;
 cos<=13;
 end
79:begin
 sin<=63;
 cos<=12;
 end
80:begin
 sin<=63;
 cos<=11;
 end
81:begin
 sin<=63;
 cos<=10;
 end
82:begin
 sin<=63;
 cos<=9;
 end
83:begin
 sin<=64;
 cos<=8;
 end
84:begin
 sin<=64;
 cos<=7;
 end
85:begin
 sin<=64;
 cos<=6;
 end
86:begin
 sin<=64;
 cos<=4;
 end
87:begin
 sin<=64;
 cos<=3;
 end
88:begin
 sin<=64;
 cos<=2;
 end
89:begin
 sin<=64;
 cos<=1;
 end
90:begin
 sin<=64;
 cos<=0;
end
endcase // case (angle)
   
end // always@ (posedge clk)
   

   endmodule

