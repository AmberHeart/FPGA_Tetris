
`timescale 1ns / 1ps

 
module debouncer_module(
	input clk,
	input rst_n,
	input key_in,
	output reg key_out);
	
reg key_in0;
reg [19:0] cnt;

wire change;
parameter N=20'hF4240;  //100 0000 若clk =100MHz, 取T=10ms, 则N =F4240= 1000000个clk周期,



// key_in0;
always@(posedge clk or negedge rst_n)
	if(!rst_n)
		key_in0<=0;
	else 
		key_in0<=key_in;
		
assign change=(key_in & !key_in0)|(!key_in & key_in0); //不抖动时一直为0

// cnt
always@(posedge clk or negedge rst_n)
	if(!rst_n)
		cnt<=0;
	else if(change) cnt<=0; //出现抖动重新计数
	else cnt<=cnt+1;

// y
always@(posedge clk or negedge rst_n)
	if(!rst_n)
		key_out<=0; 
	else if(cnt==N-1)
	key_out<=key_in;
	
endmodule
