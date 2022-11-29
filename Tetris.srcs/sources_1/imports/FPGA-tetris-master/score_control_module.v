module score_control_module
( clk, rst_n, cur_score_bin, col_addr_sig, row_addr_sig,
  pic_num_addr
);
input clk;
input rst_n;
input [7:0] cur_score_bin;  //当前分数
input [10:0] col_addr_sig;  //列地址信号
input [10:0] row_addr_sig;  //行地址信号
output [13:0] pic_num_addr; //图片地址信号

/**************************************************/

reg [13:0] pic_num_addr_r;  //图片地址信号
reg [3:0] hunds;  //百位
reg [3:0] tens;   //十位
reg [3:0] ones;  //个位
integer i;

/**************************************************/

always @(cur_score_bin) //当前分数
begin
  hunds = 4'd0;
  tens = 4'd0;
  ones = 4'd0;

  for (i = 7; i >= 0; i = i - 1)  //从高位到低位
  begin
    if (hunds >= 5) //百位大于等于5
      hunds = hunds + 3;
    if (tens >= 5)  //十位大于等于5
      tens = tens + 3;
    if (ones >= 5)  //个位大于等于5
      ones = ones + 3;

    hunds = hunds << 1; //左移一位
    hunds[0] = tens[3]; //十位的最高位赋值给百位的最低位
    tens = tens << 1; //左移一位
    tens[0] = ones[3];  //个位的最高位赋值给十位的最低位
    ones = ones << 1; //左移一位
    ones[0] = cur_score_bin[i]; //当前分数的最高位赋值给个位的最低位
  end
end

/**************************************************/

always @(posedge clk or negedge rst_n) 
  begin
    if (!rst_n) 
      pic_num_addr_r <= 0;
	 else if ( row_addr_sig >= 283 && row_addr_sig < 323 )  //
	   begin
		  if (col_addr_sig >= 195 && col_addr_sig < 220)  //百位
          pic_num_addr_r <= (row_addr_sig - 283) * 250 + hunds * 25 + col_addr_sig - 195;
        if (col_addr_sig >= 220 && col_addr_sig < 245)  //十位
          pic_num_addr_r <= (row_addr_sig - 283) * 250 + tens * 25 + col_addr_sig - 220;
        if (col_addr_sig >= 245 && col_addr_sig < 270)  //个位
          pic_num_addr_r <= (row_addr_sig - 283) * 250 + ones * 25 + col_addr_sig - 245;
      end 
  end

/**************************************************/

assign pic_num_addr = pic_num_addr_r;

/**************************************************/

endmodule