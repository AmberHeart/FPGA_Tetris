module tetris_game
( clk, rst_n,
  right, left, rotateR, down, 
  hsync_out, vsync_out, red_out, green_out, blue_out,
  vga_clk, vga_blank, vga_sync
);
input clk;  
input rst_n;
input right;
input left;
input rotateR;
input down;
output hsync_out;   //行同步信号
output vsync_out;   //场同步信号
output red_out;    //红色信号
output green_out;   //绿色信号
output blue_out;    //蓝色信号
output vga_clk;    //VGA时钟
output vga_blank;   //VGA空白信号
output vga_sync;    //VGA同步信号

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

/**************************************************/


  clk_wiz_0 U1
   (
    // Clock out ports
    .clk_out1(clk),     // output clk_out1
   // Clock in ports
    .clk_in1(clk_25MHz));  
/**************************************************/

debouncer_module U2
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .key_in(right),
 .key_out(move_right)
);  

/**************************************************/

debouncer_module U3
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .key_in(left),
 .key_out(move_left)
);

/**************************************************/

debouncer_module U4
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .key_in(rotateR),
 .key_out(rotate_r)
);

/**************************************************/

debouncer_module U5
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .key_in(down),
 .key_out(change)
);

/**************************************************/

tetris_control_module U6
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .move_right(move_right),
 .move_left(move_left),
 .rotate_r(rotate_r),
 .change(change),
 .moving_square_h(moving_square_h),
 .moving_square_v(moving_square_v),
 .moving_square(moving_square),
 .hold_square(hold_square),
 .fixed_square_map(fixed_square_map),
 .load_next_square(load_next_square),
 .cur_score_bin(cur_score_bin),
 .ingame_sig(ingame_sig),
 .game_over(game_over)
);

/**************************************************/
  
enable_border_module U7 
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .enable_border(enable_border)
);

/**************************************************/
                                
enable_moving_square U8 
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .moving_square_h(moving_square_h),
 .moving_square_v(moving_square_v),
 .moving_square(moving_square),
 .enable_moving_square(enable_moving_square)
);

/**************************************************/

enable_fixed_square_module U9 
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .fixed_square_map(fixed_square_map),
 .enable_fixed_square(enable_fixed_square)
);

/**************************************************/

enable_next_square_module U10
(
 .clk(clk_25MHz), 
 .rst_n(rst_n), 
 .col_addr_sig(col_addr_sig), 
 .row_addr_sig(row_addr_sig), 
 .load_next_square(load_next_square), 
 .enable_next_square(enable_next_square)
);   

/**************************************************/

enable_hold_square_module U11
(
 .clk(clk_25MHz), 
 .rst_n(rst_n), 
 .col_addr_sig(col_addr_sig), 
 .row_addr_sig(row_addr_sig), 
 .hold_square(hold_square), 
 .enable_hold_square(enable_hold_square)
);   

/**************************************************/

score_control_module U12
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .cur_score_bin(cur_score_bin),
 .col_addr_sig(col_addr_sig),
 .row_addr_sig(row_addr_sig),
 .pic_num_addr(pic_num_addr)
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
 .vsync_out(vsync_out),
 .pic_addr(pic_addr)
);

/**************************************************/

game_display_module U14
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .sync_ready_sig(sync_ready_sig),
 .ingame_sig(ingame_sig),
 .enable_border(enable_border),
 .enable_moving_square(enable_moving_square),
 .enable_fixed_square(enable_fixed_square),
 .enable_next_square(enable_next_square),
 .enable_hold_square(enable_hold_square),
 .pic_over_data(pic_over_data),
 .pic_next_data(pic_next_data),
 .pic_hold_data(pic_hold_data),
 .pic_score_data(pic_score_data),
 .pic_num_data(pic_num_data),
 .red_out(red_out),
 .green_out(green_out),
 .blue_out(blue_out)
);

/**************************************************/

game_process_module U15
(
 .clk(clk_25MHz),
 .rst_n(rst_n),
 .game_over(game_over),
 .ingame_sig(ingame_sig)
); 

/**************************************************/

// pic_over_module U16
// (
//  .clka(clk_25MHz),
//  .addra(pic_addr),
//  .douta(pic_over_data)
// ); 
 
// /**************************************************/ 

// pic_next_module U17
// (
//  .clka(clk_25MHz),
//  .addra(pic_addr),
//  .douta(pic_next_data)
// ); 

// /**************************************************/ 

// pic_hold_module U18
// (
//  .clka(clk_25MHz),
//  .addra(pic_addr),
//  .douta(pic_hold_data)
// ); 

// /**************************************************/

// pic_score_module U19
// (
//  .clka(clk_25MHz),
//  .addra(pic_addr),
//  .douta(pic_score_data)
// ); 

// /**************************************************/

// pic_num_module U20
// (
//  .clka(clk_25MHz),
//  .addra(pic_num_addr),
//  .douta(pic_num_data)
// ); 

/**************************************************/

assign vga_clk = ~clk_25MHz;
assign vga_blank = hsync_out & vsync_out;
assign vga_sync = 1'b0;

/**************************************************/

endmodule
