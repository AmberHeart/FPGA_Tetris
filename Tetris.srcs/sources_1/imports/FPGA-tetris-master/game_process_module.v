module game_process_module
( clk, rst_n, game_over, game_start,
  ingame_sig, start_sig
);
input clk;
input rst_n;
input game_over;
input [1:0] game_start; // 第0位为1: easy, 第1位为1: hard
output ingame_sig;
output start_sig;

/**************************************************/

parameter start=2'b00, in_game = 2'b10, out_game = 2'b11;

/**************************************************/

reg [1:0] game_current_process;   //当前游戏状态
reg [1:0] game_next_process;    //下一游戏状态
reg ingame_sig_r;  //游戏状态信号
reg start_sig_r;  //游戏状态信号

/**************************************************/

always @ ( posedge clk or negedge rst_n )
begin
  if( !rst_n )
     game_current_process <= start; //当前游戏状态 = 开启界面
  else 
     game_current_process <= game_next_process; //当前游戏状态 = 下一游戏状态
end
  
always @ (*)
begin
  case( game_current_process )
    start:
      begin
        ingame_sig_r = 0;
        start_sig_r = 1;
        if( game_start == 2'b01 ) //easy模式
          game_next_process = in_game; //下一游戏状态 = 游戏界面
        else if(game_start == 2'b10) //hard模式
          game_next_process = in_game; //下一游戏状态 = 游戏界面
        else
          game_next_process = start; //下一游戏状态 = 开启界面
      end
    in_game:    
    begin
      ingame_sig_r = 1; //游戏状态信号 = 1
      start_sig_r = 0;
      if( game_over )
        game_next_process = out_game; //下一游戏状态 = out_game
      else 
        game_next_process = in_game;  //下一游戏状态 = in_game
    end
    out_game:
    begin
      ingame_sig_r = 0; //游戏状态信号 = 0
      start_sig_r = 0;
      game_next_process = out_game; //下一游戏状态 = out_game
    end
  endcase
end

/**************************************************/

assign ingame_sig = ingame_sig_r; //游戏状态信号 = ingame_sig_r
assign start_sig = start_sig_r; //游戏状态信号 = start_sig_r

/**************************************************/

endmodule
 

   
   