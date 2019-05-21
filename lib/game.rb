require_relative "../lib/ui.rb"
class Game
  attr_reader :player_1, :player_2, :board
  def initialize(player_1, player_2, board)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
  end

  include UserInterface

  def cycle
    symbol = "X"
    while !game_over?
      display_board
      if symbol =="X"
        won = switch_players(player_1)
        break if won ==1
        symbol = "O"
      else
        won = switch_players(player_2)
        break if won ==1
        symbol = "X"
      end
    end
    is_draw
  end

  private

  def switch_players(player)
    play(player)
    if board.win?(player.moves)
      display_winner(player.name)
      return 1
    end
    0
  end

  def game_over?
    board.full?
  end
end
