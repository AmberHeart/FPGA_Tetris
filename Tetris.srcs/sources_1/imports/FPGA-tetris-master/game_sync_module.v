module game_sync_module
( clk, rst_n, 
  sync_ready_sig, col_addr_sig, row_addr_sig, 
  hsync_out, vsync_out
);
input clk;
input rst_n;
output sync_ready_sig;    // sync ready signal
output [10:0] col_addr_sig; //行地址
output [10:0] row_addr_sig; //列地址
output hsync_out;        //水平同步信号 
output vsync_out;       //垂直同步信号
// output [18:0] pic_addr; //图像地址

/**************************************************/

reg [18:0] cnt_h; //水平计数器
reg [18:0] cnt_v; //垂直计数器
reg sync_ready_sig_r; //sync ready信号
wire [18:0] pic_addr_w; //图像地址
wire [18:0] col_addr_sig_w; //行地址
wire [18:0] row_addr_sig_w; //列地址

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      cnt_h <= 18'd0;
    else if( cnt_h == 18'd800 ) //水平计数器到800时，清零
      cnt_h <= 18'd0;
    else cnt_h <= cnt_h + 1'b1; //水平计数器加1
  end

always @ ( posedge clk or negedge rst_n )
  begin  
    if( !rst_n )
      cnt_v <= 18'd0;
    else if( cnt_v == 18'd525 ) //垂直计数器到525时，垂直计数器清零
      cnt_v <= 18'd0;
    else if( cnt_h == 18'd800 ) //水平计数器到800时，垂直计数器加1
      cnt_v <= cnt_v + 1'b1;
  end 
  
/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      sync_ready_sig_r <= 1'b0; //sync ready信号清零
    else if( cnt_h >= 144 && cnt_h < 784 && cnt_v >= 35 && cnt_v < 515 )  //水平计数器在144到784之间，垂直计数器在35到515之间，sync ready信号置1
      sync_ready_sig_r <= 1'b1; 
    else sync_ready_sig_r <= 1'b0;  //其他情况，sync ready信号清零
  end
  
/**************************************************/

// assign pic_addr_w = col_addr_sig_w + row_addr_sig_w * 640;  //图像地址 = 行地址 + 列地址 * 640
assign col_addr_sig_w = sync_ready_sig_r ? ( cnt_h - 18'd144 ) : 18'd0; //行地址 = sync ready信号为1时，水平计数器 - 144
assign row_addr_sig_w = sync_ready_sig_r ? ( cnt_v - 18'd35 ) : 18'd0;  //列地址 = sync ready信号为1时，垂直计数器 - 35

/**************************************************/

assign sync_ready_sig = sync_ready_sig_r; //sync ready信号
assign col_addr_sig = col_addr_sig_w[10:0]; //行地址
assign row_addr_sig = row_addr_sig_w[10:0]; //列地址
assign hsync_out = ( cnt_h <= 11'd96 ) ? 1'b0 : 1'b1; //水平同步信号 = 水平计数器 <= 96时，水平同步信号为0，否则为1
assign vsync_out = ( cnt_v <= 11'd2 ) ? 1'b0 : 1'b1;  //垂直同步信号 = 垂直计数器 <= 2时，垂直同步信号为0，否则为1
// assign pic_addr = pic_addr_w; //图像地址

/**************************************************/

endmodule
        
