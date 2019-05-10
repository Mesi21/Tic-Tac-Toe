require_relative "../lib/player"
require_relative "../lib/game"
require_relative "../lib/board"

def play(game)
    while !game.over?
      if(game.turns%2 !=0)
        move(game.player_1, game)
      else
        move(game.player_2, game)
      end
    end
end
def move(player, game)
    puts "#{player.name} please choose the position to put your symbol: "
    choice = gets.chomp.to_i
    while (!game.game_board.board.include?(choice)) || (!game.game_board.board[choice-1].is_a? Integer)
       puts "Wrong choice! You need to choose a number between 1  and 9 that is available on the board."
       game.game_board.display_board
       puts "#{player.name} please choose a valid position: "
       choice = gets.chomp.to_i
    end
    game.turns += 1
    game.game_board.board[choice-1] = player.symbol
    player.moves << choice
    game.game_board.display_board
end

puts "======================================="
puts "*** Welcome to our Tic-Tac-Toe Game ***"
puts "======================================="
puts "*************** RULES *****************"
puts "Two players will take turns to mark the"
puts "spaces on a 3x3 grid. The player who   "
puts "succeeds in placing 3 of their marks in"
puts "a horizontal, vertical, or diagonal row"
puts "wins the game. When there are no more  "
puts "spaces left to mark, it is consider a  "
puts "draw. To place a mark on the grid, type"
puts "the number on the space you would like "
puts "to mark! As shown below. Good luck! \n "

loop do
    puts "Let's get started!"
    board = Board.new([1,2,3,4,5,6,7,8,9])
    board.display_board
    puts "Enter name for player1:"
    player1_name = gets.chomp
    puts "Enter name for player2:"
    player2_name = gets.chomp
    puts "#{player1_name} choose a symbol:"
    symbol = gets.chomp.upcase
    valid_symbols = ["X", "O"]
    while !valid_symbols.include?(symbol)
       puts "Wrong choice! You need to choose either X or O."
       puts "#{player1_name} please choose a valid symbol:"
       symbol = gets.chomp.upcase
    end
    symbol2 = ""
    symbol == "X" ? symbol2 = "O" : symbol2 = "X"
    player_1 = Player.new(player1_name, symbol)
    player_2 = Player.new(player2_name, symbol2)
    print "#{player1_name} your symbol is #{symbol} and "
    puts "#{player2_name} your symbol is #{symbol2}"
    game = Game.new(player_1, player_2, board)
    play(game)
    puts "Press any key to play again or press 'Q' to quit:"
    choice = gets.chomp.upcase
    break if choice == "Q"
    system "clear"
end

