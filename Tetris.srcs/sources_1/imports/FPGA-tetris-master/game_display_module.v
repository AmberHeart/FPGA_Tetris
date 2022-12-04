module game_display_module
( clk, rst_n, sync_ready_sig, ingame_sig,
  enable_border, enable_moving_square, enable_fixed_square, enable_next_square, enable_hold_square,
  pic_over_data, pic_next_data, pic_hold_data, pic_score_data, pic_num_data,start_sig,
  red_out, green_out, blue_out,load_next_square, col_addr_sig,row_addr_sig
);
input clk;
input rst_n;  
input sync_ready_sig;
input ingame_sig;
input start_sig;
input enable_border;
input enable_moving_square;
input enable_fixed_square;
input enable_next_square;
input enable_hold_square;
input load_next_square;
input pic_over_data;
input pic_next_data;
input pic_hold_data;
input pic_score_data;
input pic_num_data;
input [10:0] col_addr_sig;
input [10:0] row_addr_sig;
output [3:0] red_out;
output [3:0] green_out;
output [3:0] blue_out;
wire [11:0] random_rgb_data;

random_rgb U1
(
  .clk(clk),
  .rst_n(rst_n),
  .ena(load_next_square),
  .seed(12'hCEA),
  .data(random_rgb_data)
);

wire [16:0] start_addr;
assign start_addr = ((row_addr_sig >> 1) *320) + (col_addr_sig >> 1);
wire [11:0] start_rgb;
blk_mem_gen_2 your_instance_name (
  .clka(clk),    // input wire clka
  .ena(start_sig),      // input wire ena
  .addra(start_addr),  // input wire [16 : 0] addra
  .douta(start_rgb)  // output wire [11 : 0] douta
);

/**************************************************/		  

reg bg_red;
reg bg_green;
reg bg_blue;
reg [3:0] red_out_r;
reg [3:0] green_out_r;
reg [3:0] blue_out_r;

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin 
    if( !rst_n )
      begin 
        bg_red   <= pic_next_data | pic_hold_data | pic_score_data | enable_border | pic_num_data | enable_next_square | enable_hold_square;
        bg_green <= pic_next_data | pic_hold_data | pic_score_data | enable_border | pic_num_data | enable_next_square | enable_hold_square | enable_fixed_square;
        bg_blue  <= pic_next_data | pic_hold_data | pic_score_data | enable_border | enable_fixed_square;
      end
    else if( sync_ready_sig ) //行有效且场有效
      begin
        bg_red   <= pic_next_data | pic_hold_data | pic_score_data | enable_border | pic_num_data | enable_next_square | enable_hold_square;
        bg_green <= pic_next_data | pic_hold_data | pic_score_data | enable_border | pic_num_data | enable_next_square | enable_hold_square | enable_fixed_square;
        bg_blue  <= pic_next_data | pic_hold_data | pic_score_data | enable_border | enable_fixed_square;
      end
    else //其他情况RGB置0
      begin
        bg_red<=0;
        bg_blue<=0;
        bg_green<=0;
      end
  end

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin 
    if( !rst_n )
      begin 
         red_out_r   <= enable_moving_square? random_rgb_data[11:8] : {bg_red, bg_red, bg_red, bg_red};
        green_out_r <= enable_moving_square? random_rgb_data[7:4]  : {bg_green, bg_green, bg_green, bg_green};
        blue_out_r  <= enable_moving_square? random_rgb_data[3:0]  : {bg_blue, bg_blue, bg_blue, bg_blue};
        end
	 else if( ingame_sig == 1 )
	    begin 
        red_out_r   <= enable_moving_square? random_rgb_data[11:8] : {bg_red, bg_red, bg_red, bg_red};
        green_out_r <= enable_moving_square? random_rgb_data[7:4]  : {bg_green, bg_green, bg_green, bg_green};
        blue_out_r  <= enable_moving_square? random_rgb_data[3:0]  : {bg_blue, bg_blue, bg_blue, bg_blue};
      end
    else if( ingame_sig == 0 )
      begin
        red_out_r   <= {bg_red   | pic_over_data, bg_red   | pic_over_data, bg_red   | pic_over_data, bg_red   | pic_over_data};
        green_out_r <= enable_moving_square? random_rgb_data[7:4]  : {bg_green, bg_green, bg_green, bg_green};
        blue_out_r  <= enable_moving_square? random_rgb_data[3:0]  : {bg_blue, bg_blue, bg_blue, bg_blue};
      end
    else 
      begin
        red_out_r   <= enable_moving_square? random_rgb_data[11:8] : {bg_red, bg_red, bg_red, bg_red};
        green_out_r <= enable_moving_square? random_rgb_data[7:4]  : {bg_green, bg_green, bg_green, bg_green};
        blue_out_r  <= enable_moving_square? random_rgb_data[3:0]  : {bg_blue, bg_blue, bg_blue, bg_blue};
      end  
  end 
 
wire [11:0] rgbdata;
wire [14:0] addra;
wire [3:0] red_back;
wire [3:0] green_back;
wire [3:0] blue_back;
assign addra = ((row_addr_sig >> 2) * 160) + (col_addr_sig >> 2);

blk_mem_gen_1 your_instance_name21 (
  .clka(clk),    // input wire clka
  .ena(1),      // input wire ena
  .addra(addra),  // input wire [14 : 0] addra
  .douta(rgbdata)  // output wire [11 : 0] douta
);

assign red_back   = rgbdata[11:8];
assign green_back = (~ingame_sig & pic_over_data) ? 0: rgbdata[7:4];
assign blue_back  = (~ingame_sig & pic_over_data) ? 0: rgbdata[3:0];

// wire [3:0] red_out_f, green_out_f, blue_out_f;
// assign red_out_f   = red_out_r   ? 4'b1111  : 4'b0000;
// assign green_out_f = green_out_r ? 4'b1111  : 4'b0000;
// assign blue_out_f  = blue_out_r  ? 4'b1111  : 4'b0000;


/**************************************************/

assign red_out = start_sig? start_rgb[11:8]:(red_out_r ? red_out_r : red_back);
assign green_out = start_sig? start_rgb[7:4]:(green_out_r ? green_out_r : green_back);
assign blue_out = start_sig? start_rgb[3:0]:(blue_out_r ? blue_out_r : blue_back);
// assign red_out = red_back;
// assign green_out = green_back;
// assign blue_out = blue_back;

/**************************************************/

endmodule