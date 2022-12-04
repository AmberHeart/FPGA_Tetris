`timescale 1ns / 1ps



 
module DB(
	input clk,
	input nrst,
	input x,
	output reg y);
	
reg x0;
reg [19:0] cnt;

wire change;
parameter N=20'hF4240;  //100 0000 若clk =100MHz, 取T=10ms, 则N =F4240= 1000000个clk周期,



// x0;
always@(posedge clk or negedge nrst)
	if(!nrst)
		x0<=0;
	else 
		x0<=x;
		
assign change=(x & !x0)|(!x & x0); //不抖动时一直为0

// cnt
always@(posedge clk or negedge nrst)
	if(!nrst)
		cnt<=0;
	else if(change) cnt<=0; //出现抖动重新计数
	else cnt<=cnt+1;

// y
always@(posedge clk or negedge nrst)
	if(!nrst)
		y<=0; 
	else if(cnt==N-1)
	y<=x;
	
endmodule
