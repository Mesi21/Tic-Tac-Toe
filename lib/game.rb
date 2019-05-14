require_relative "../lib/board.rb"
class Game
  attr_reader :player_1, :player_2,:turn, :game_board
  def initialize(player_1, player_2, board)
      @turn = 1
      @game_board = board
      @player_1 = player_1
      @player_2 = player_2
  end
  def start
    until (over? || @game_board.full?)
      @turn == 1 ? play(@player_1) : play(@player_2)
      next if over?
      @turn = @turn == 1 ? 0 : 1
    end
    game_end
  end
  def game_end
    if over?
      @game_board.display_board
      puts "Winner is: #{over?}"
    elsif @game_board.full?
      @game_board.display_board
      puts 'It is a tie'
    end
  end
  def play(player)
    loop do
      @game_board.display_board
      valid_move = player.move(@game_board)
      next unless valid_move
      @game_board.fill_pos(valid_move-1, player.symbol)
      player.moves.push(valid_move).sort!
      break
    end
  end
  def over?
    if win?
      if @turn == 1
        @player_1.name
      else
        @player_2.name
      end
    else
      return false
    end
  end
  def win?
    lines = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
    (@player_1.moves.permutation(3).to_a & lines).length > 0 or (@player_2.moves.permutation(3).to_a & lines).length > 0
  end
end
