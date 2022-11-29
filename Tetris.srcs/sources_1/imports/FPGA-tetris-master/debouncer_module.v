module debouncer_module
( clk, rst_n, key_in, 
  key_out
);
input clk;
input rst_n;
input key_in;
output key_out;

/**************************************************/

reg key_in_dly1;  //键入延时1
reg key_in_dly2;  //键入延时2
reg [17:0] count_debouncer; //计数器
reg key_out_r;  //键出
reg key_out_dly1_r; //键出延时1

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
       begin
         key_in_dly1 <= 1'b0;
         key_in_dly2 <= 1'b0;
       end
    else    
       begin
         key_in_dly1 <= key_in; //键入延时1 = 键入
         key_in_dly2 <= key_in_dly1;  //键入延时2 = 键入延时1
       end
  end

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      begin
        count_debouncer <= 18'd260_000; //计数器 = 18'd260_000
	      key_out_r <= 1'b0;  //键出 = 1'b0
      end
    else if( key_in_dly2 )  //键入延时2
      begin
        count_debouncer <= 18'd0; //计数器 = 18'd0
	      key_out_r <= 1'b0;  //键出 = 1'b0
      end
    else if( count_debouncer == 18'd250_000 ) //计数器 == 18'd250_000
      begin
        key_out_r <= 1'b1;  //键出 = 1'b1 
      end
    else if( count_debouncer == 18'd260_000 ) //计数器 == 18'd260_000
      begin
        key_out_r <= 1'b0;  //键出 = 1'b0
      end
    else
      count_debouncer <= count_debouncer + 1'b1;  //计数器 = 计数器 + 1'b1
  end

/**************************************************/

always @ ( posedge clk or negedge rst_n )
  begin
    if( !rst_n )
      key_out_dly1_r <= 1'b0; //键出延时1 = 1'b0
    else
      key_out_dly1_r <= key_out_r;  //键出延时1 = 键出
  end
  
/**************************************************/  

assign key_out = key_out_r & ( ~key_out_dly1_r ); //键出 = 键出 & ( ~键出延时1 )

/**************************************************/

endmodule


