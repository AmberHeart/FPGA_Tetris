`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 13:03:24
// Design Name: 
// Module Name: game_display_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module game_display_tb();
reg clk;
reg rst_n;  
reg sync_ready_sig;
reg ingame_sig;
reg enable_border;
reg enable_moving_square;
reg enable_fixed_square;
reg enable_next_square;
reg enable_hold_square;
reg pic_over_data;
reg pic_next_data;
reg pic_hold_data;
reg pic_score_data;
reg pic_num_data;
reg [7:0] col_addr_sig;
reg [7:0] row_addr_sig;
wire [3:0] red_out;
wire [3:0] green_out;
wire [3:0] blue_out;

game_display_module uut(
    .clk(clk),
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
    .col_addr_sig(col_addr_sig),
    .row_addr_sig(row_addr_sig),
    .red_out(red_out),
    .green_out(green_out),
    .blue_out(blue_out)
    );

initial begin
    rst_n = 1'b1;
    clk = 1'b0;
    sync_ready_sig = 1'b1;
    ingame_sig = 1'b1;
    enable_border = 1'b0;
    enable_moving_square = 1'b0;
    enable_fixed_square = 1'b0;
    enable_next_square = 1'b0;
    enable_hold_square = 1'b0;
    pic_over_data = 1'b0;
    pic_next_data = 1'b0;
    pic_hold_data = 1'b0;
    pic_score_data = 1'b0;
    pic_num_data = 1'b0;
    col_addr_sig = 8'b00000000;
    row_addr_sig = 8'b00000000;
    #1 rst_n = 1'b0;
    #1 rst_n = 1'b1;
end

always #1 clk = ~clk;
always begin
     #2 col_addr_sig = col_addr_sig + 1;
    if(col_addr_sig == 640) begin
        col_addr_sig = 8'b00000000;
        row_addr_sig = row_addr_sig + 1;
    end
    if(row_addr_sig == 480) begin
        row_addr_sig = 8'b00000000;
    end
end
endmodule
