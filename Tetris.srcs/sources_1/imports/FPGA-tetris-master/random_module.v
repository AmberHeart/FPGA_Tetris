module random_rgb(input wire clk,
              input wire rst_n,
              input wire ena,
              input wire [11:0] seed,
              output reg [11:0] data);
    
    always @ (posedge clk or negedge rst_n) begin
        if (rst_n == 1'b0)
            data <= seed;
        else if (ena == 1'b1) begin
            data[0]  <= data[11];
            data[1]  <= data[0] ^ data[11];
            data[2]  <= data[1] ^ data[11];
            data[3]  <= data[2] ^ data[11];
            data[4]  <= data[3];
            data[5]  <= data[4] ^ data[11];
            data[6]  <= data[5];
            data[7]  <= data[6] ^ data[11];
            data[8]  <= data[7];
            data[9]  <= data[8];
            data[10] <= data[9];
            data[11] <= data[10];
        end
        else
            data <= data;
    end
    
endmodule
