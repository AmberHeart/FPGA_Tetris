module game_process_module
( clk, rst_n, game_over, 
  ingame_sig
);
input clk;
input rst_n;
input game_over;
output ingame_sig;

/**************************************************/

parameter in_game = 1'b1, out_game = 1'b0;

/**************************************************/

reg game_current_process;   //当前游戏状态
reg game_next_process;    //下一游戏状态
reg ingame_sig_r;  //游戏状态信号

/**************************************************/

always @ ( posedge clk or negedge rst_n )
begin
  if( !rst_n )
     game_current_process <= in_game; //当前游戏状态 = in_game
  else 
     game_current_process <= game_next_process; //当前游戏状态 = 下一游戏状态
end
  
always @ ( game_current_process or game_over )
begin
  case( game_current_process )
    in_game:    
    begin
      ingame_sig_r = 1; //游戏状态信号 = 1
      if( game_over )
        game_next_process = out_game; //下一游戏状态 = out_game
      else 
        game_next_process = in_game;  //下一游戏状态 = in_game
    end
    out_game:
    begin
      ingame_sig_r = 0; //游戏状态信号 = 0
      game_next_process = out_game; //下一游戏状态 = out_game
    end
  endcase
end

/**************************************************/

assign ingame_sig = ingame_sig_r; //游戏状态信号 = ingame_sig_r

/**************************************************/

endmodule
 

   
   