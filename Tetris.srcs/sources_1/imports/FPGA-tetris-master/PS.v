`timescale 1ns / 1ps
module PS(
  input clk,//时钟
  input nrst,//复位
  input s,//输入信号
  output pos_edge//提取的上升沿
);


reg delay1;//一级寄存器
reg delay2;//二级寄存器

always @(posedge clk or negedge nrst )
begin
    if(nrst==1'b0)//复位操作
      begin 
      delay1<=1'b0;
      delay2<=1'b0;
      end
    else
      begin
      delay1<=s;//第一个时钟上升沿，输入信号电平锁存到一级寄存器中
      delay2<=delay1;//第二个时钟上升沿，锁存在一级寄存器中的信号进入二级寄存器中，一级寄存器读取新的输入电平，也就是说第二个时钟上升沿，二级寄存器中锁存的是第一个时钟上升沿的输入信号电平，一级寄存器中锁存的是第二个时钟上升沿的输入信号电平
    end
end

assign pos_edge = delay1 & ~delay2;//如果二级寄存器中的电平为低，一级寄存器电平为高，说明电平由低到高，提取上升沿



endmodule



