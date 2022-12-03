module pic_next_module(
    input clka,
    input [10:0] col_addr_sig,
    input [10:0] row_addr_sig,
    output douta
);
    parameter addr_start = 0, addr_round = 104;
    parameter col_start = 30, col_end = 158;
    parameter row_start = 84, row_end = 116;
    reg [11:0] addr;
    wire [7:0] dout;
    always@(*)begin
        if(col_addr_sig >= col_start && col_addr_sig < col_end && row_addr_sig >= row_start && row_addr_sig <= row_end)
            addr = (row_addr_sig - row_start) * addr_round + (col_addr_sig - col_start)/8 + addr_start;
        else
            addr = 0;
    end
    blk_mem_gen_0  rom_1(
    .clka(clka),    // input wire clka
    .ena(1'b1),      // input wire ena
    .addra(addr),  // input wire [11 : 0] addra
    .douta(dout)  // output wire [15 : 0] douta
    );  
    assign douta = dout[7-(col_addr_sig - col_start)%8];


endmodule