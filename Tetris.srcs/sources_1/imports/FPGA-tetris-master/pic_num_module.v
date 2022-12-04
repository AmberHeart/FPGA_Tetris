module pic_num_module(
    input clka,
    input rst_n,
    input [7:0] cur_score_bin,  //当前分数
    input [10:0] col_addr_sig,
    input [10:0] row_addr_sig,
    output douta
);
    parameter addr_start = 64, addr_round = 104;
    parameter col_start = 195, col_end = 195+32*3;
    parameter row_start = 284, row_end = 316;
    reg [3:0] hunds;  //百位
    reg [3:0] tens;   //十位
    reg [3:0] ones;  //个位
    integer i;//循环变量

    //进制转换算法
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

    reg [11:0] addr;
    wire [7:0] dout;

    always@(posedge clka or negedge rst_n)begin
        if(!rst_n)
            addr <=0;
        else if(row_addr_sig >= row_start && row_addr_sig <= row_end && col_addr_sig >= col_start && col_addr_sig < col_end)
        begin
            if(col_addr_sig >= col_start && col_addr_sig < col_start + 32)
                addr <= (row_addr_sig - row_start) * addr_round + (col_addr_sig - col_start)/8 + addr_start + 4 * hunds;
            if(col_addr_sig >= col_start + 32 && col_addr_sig < col_start + 64)
                addr <= (row_addr_sig - row_start) * addr_round + (col_addr_sig - col_start - 32)/8 + addr_start + 4 * tens;
            if(col_addr_sig >= col_start + 64 && col_addr_sig < col_start + 96)
                addr <= (row_addr_sig - row_start) * addr_round + (col_addr_sig - col_start - 64)/8 + addr_start + 4 * ones;
        end
        else
            addr <= 0;
    end

    blk_mem_gen_0  rom_5(
    .clka(clka),    // input wire clka
    .ena(1'b1),      // input wire ena
    .addra(addr),  // input wire [11 : 0] addra
    .douta(dout)  // output wire [15 : 0] douta
    );  
    assign douta = dout[7-(col_addr_sig - col_start)%8];

endmodule