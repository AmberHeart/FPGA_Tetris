module enable_border_module
( clk, rst_n, col_addr_sig, row_addr_sig, 
  enable_border
);
input clk;
input rst_n;
input [10:0] col_addr_sig;  //行地址
input [10:0] row_addr_sig;  //列地址
output enable_border;

/**************************************************/

parameter h_start = 11'd300;  //水平起始位置
parameter v_start = 11'd50;   //垂直起始位置
parameter border_width = 11'd10;  //边框宽度

/**************************************************/

reg out_h;  //外边框水平
reg out_v;  //外边框垂直
reg in_h;  //内边框水平
reg in_v; //内边框垂直
reg enable_border_r;  //边框使能

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      out_h <= 1'b0;
    else if( col_addr_sig == h_start )  //行地址 = 水平起始位置
      out_h <= 1'b1;
    else if( col_addr_sig == h_start + 11'd221 )  //行地址 = 水平起始位置 + 221
      out_h <= 1'b0;  
    else 
      out_h <= out_h; 
  end
  
always @ ( posedge clk or negedge rst_n )
  begin 
    if( !rst_n )
      out_v <= 1'b0;
    else if( row_addr_sig == v_start )  //列地址 = 垂直起始位置
      out_v <= 1'b1;
    else if( row_addr_sig == v_start + 11'd281 )  //列地址 = 垂直起始位置 + 281
      out_v <= 1'b0;
    else 
      out_v <= out_v;
  end
  
/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      in_h <= 1'b0;
    else if( col_addr_sig == h_start + border_width )   //行地址 = 水平起始位置 + 边框宽度
      in_h <= 1'b1;
    else if( col_addr_sig == h_start + 11'd211 )  //行地址 = 水平起始位置 + 211
      in_h <= 1'b0;
    else 
      in_h <= in_h;
  end
  
always @ ( posedge clk or negedge rst_n )
  begin 
    if( !rst_n )
      in_v <= 1'b0;
    else if( row_addr_sig == v_start + border_width ) //列地址 = 垂直起始位置 + 边框宽度
      in_v <= 1'b1;
    else if( row_addr_sig == v_start + 11'd271 )  //列地址 = 垂直起始位置 + 271
      in_v <= 1'b0;
    else 
      in_v <= in_v;
  end
  
/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin 
    if( !rst_n )
      enable_border_r <= 1'b0;
    else //外边框以内，内边框以外显示
      enable_border_r <= ( out_h && out_v ) && ( !( in_h && in_v ) ); //边框使能 = (外边框水平 && 外边框垂直) && !(内边框水平 && 内边框垂直)
  end
  
/**************************************************/

assign enable_border = enable_border_r;

/**************************************************/

endmodule

