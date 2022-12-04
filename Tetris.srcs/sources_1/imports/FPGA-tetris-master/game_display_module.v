module game_display_module
( clk, rst_n, sync_ready_sig, ingame_sig,
  enable_border, enable_moving_square, enable_fixed_square, enable_next_square, enable_hold_square,
  pic_over_data, pic_next_data, pic_hold_data, pic_score_data, pic_num_data,
  red_out, green_out, blue_out, col_addr_sig,row_addr_sig
);
input clk;
input rst_n;  
input sync_ready_sig;
input ingame_sig;
input enable_border;
input enable_moving_square;
input enable_fixed_square;
input enable_next_square;
input enable_hold_square;
input pic_over_data;
input pic_next_data;
input pic_hold_data;
input pic_score_data;
input pic_num_data;
input [7:0] col_addr_sig;
input [7:0] row_addr_sig;
output [3:0] red_out;
output [3:0] green_out;
output [3:0] blue_out;

/**************************************************/		  

reg bg_red;
reg bg_green;
reg bg_blue;
reg red_out_r;
reg green_out_r;
reg blue_out_r;

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
        red_out_r   <= bg_red   | enable_moving_square;
/*        green_out_r <= bg_green | enable_moving_square;
        blue_out_r  <= bg_blue;
*/      end
	 else if( ingame_sig == 1 )
	    begin 
        red_out_r   <= bg_red   | enable_moving_square;
        green_out_r <= bg_green | enable_moving_square;
        blue_out_r  <= bg_blue;
      end
    else if( ingame_sig == 0 )
      begin
        red_out_r   <= bg_red   | pic_over_data;
        green_out_r <= bg_green | enable_moving_square;
        blue_out_r  <= bg_blue  | enable_moving_square;
      end
    else 
      begin
        red_out_r   <= bg_red   | enable_moving_square;
        green_out_r <= bg_green | enable_moving_square;
        blue_out_r  <= bg_blue;
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
assign green_back = rgbdata[7:4];
assign blue_back  = rgbdata[3:0];

wire [3:0] red_out_f, green_out_f, blue_out_f;
assign red_out_f   = red_out_r   ? 4'b1111  : 4'b0000;
assign green_out_f = green_out_r ? 4'b1111  : 4'b0000;
assign blue_out_f  = blue_out_r  ? 4'b1111  : 4'b0000;


/**************************************************/

assign red_out = red_out_r ? red_out_f : red_back;
assign green_out = green_out_r ? green_out_f : green_back;
assign blue_out = blue_out_r ? blue_out_f : blue_back;

/**************************************************/

endmodule