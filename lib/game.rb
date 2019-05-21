require_relative "../lib/ui.rb"
class Game
  attr_reader :player_1, :player_2, :board, :turn
  def initialize(player_1, player_2, board)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
      @turn = 1
  end
  include UserInterface
  def cycle
    while !game_over?
      display_board
      turn == 1 ? play(player_1) : play(player_2)
      if turn == 1
        turn = 0
      else
        turn = 1
      end
      puts turn
      change_turns
    end
    puts "Game over! It's a tie!" if game_over?
  end

  private
  def game_over?
    board.full?
  end
  def change_turns
   
  end
end
