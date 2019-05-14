require_relative "../lib/player"
require_relative "../lib/game"
require_relative "../lib/board"

def create_player(player_symbol)
  puts "Enter a player who wish to choose #{player_symbol}:"
  name = gets.chomp
  Player.new(name, player_symbol)
end
def setup
  player_1 = create_player("X")
  player_2 = create_player("O")
  puts "*************************************"
  board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
  game = Game.new(player_1, player_2, board)
  game.start
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
    setup
    puts "Press any key to play again or press 'Q' to quit:"
    choice = gets.chomp.upcase
    break if choice == "Q"
    system "clear"
end
