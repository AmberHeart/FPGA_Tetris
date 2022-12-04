module background_test
( clk, rst_n,
  right,acc, left, rotateR, down, 
  hsync_out, vsync_out, red_out, green_out, blue_out/* ,
  vga_clk, vga_blank, vga_sync */
);
input clk;  
input rst_n;
input right;
input acc;
input left;
input rotateR;
input down;
output hsync_out;   //行同步信号
output vsync_out;   //场同步信号
output [3:0] red_out;    //红色信号
output [3:0] green_out;   //绿色信号
output [3:0] blue_out;    //蓝色信号
/* output vga_clk;    //VGA时钟
output vga_blank;   //VGA空白信号
output vga_sync;    //VGA同步信号 */

/**************************************************/

wire clk_25MHz;
wire move_right;
wire move_left;
wire rotate_r;
wire change;
wire [10:0] moving_square_h;
wire [10:0] moving_square_v;
wire [299:0] fixed_square_map;
wire [15:0] moving_square;
wire load_next_square;
wire enable_border;
wire enable_moving_square;
wire enable_fixed_square;
wire enable_next_square;
wire enable_hold_square;
wire [10:0] col_addr_sig;
wire [10:0] row_addr_sig;
wire sync_ready_sig;
wire ingame_sig;
wire [18:0] pic_addr;
wire [15:0] hold_square;
wire pic_hold_data;
wire pic_next_data;
wire pic_over_data;
wire pic_score_data;
wire [7:0] cur_score_bin;
wire pic_num_data;
wire [13:0] pic_num_addr;
wire game_over;
wire [3:0]db;
/**************************************************/


/* clk_wiz_0 U1
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1////
   // Clock in ports
    .clk_in1(clk_25MHz));   */
/**************************************************/

clk_gen_module U1 (
  .clk_in (clk ),
  .clk_25MHz  ( clk_25MHz)
);


/**************************************************/

game_sync_module U13 
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .sync_ready_sig(sync_ready_sig),
 .col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .hsync_out(hsync_out),
 .vsync_out(vsync_out)
);

/**************************************************/

game_display_module U14
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .sync_ready_sig(sync_ready_sig),
 .ingame_sig(1),
.col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .enable_border(0),
 .enable_moving_square(0),
 .enable_fixed_square(0),
 .enable_next_square(0),
 .enable_hold_square(0),
 .pic_over_data(0),
 .pic_next_data(0),
 .pic_hold_data(0),
 .pic_score_data(0),
 .pic_num_data(0),
 .red_out(red_out),
 .green_out(green_out),
 .blue_out(blue_out)
);


/**************************************************/

// assign vga_clk = ~clk_25MHz;
// assign vga_blank = hsync_out & vsync_out;
// assign vga_sync = 1'b0;

/**************************************************/

endmodule
