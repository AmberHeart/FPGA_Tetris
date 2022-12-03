`timescale  1ns / 1ps

module pic_num_module_tb();
    reg clka;
    reg [10:0] col_addr_sig;
    reg [10:0] row_addr_sig;
    reg [7:0] score;
    wire douta;

    initial begin
        clka = 0;
        col_addr_sig = 30;
        row_addr_sig = 158;
        score = 0;
    end
    always #1 clka = ~clka;
    always #4 col_addr_sig = col_addr_sig + 1;
    //always #20 score = score + 1;
    always@(*)
    begin
        if(col_addr_sig > 158) begin
            col_addr_sig = 30;
            row_addr_sig = row_addr_sig + 1;
    end
        if(row_addr_sig > 116)
            row_addr_sig = 84;
    end
    pic_num_module uut(
        .clka(clka),
        .col_addr_sig(col_addr_sig),
        .row_addr_sig(row_addr_sig),
        .cur_score_bin(score),
        .douta(douta)
    );
endmodule