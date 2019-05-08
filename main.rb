class Player
    attr_accessor :symbol, :name, :moves
    def initialize(name)
        @name = name
        @moves = []
    end
end
class Game
    attr_accessor :board, :player_1, :player_2, :turns
    def initialize(board)
        @board = board
        @turns = 1
    end
    def display_board
        puts " #{@board[0]} ┃ #{@board[1]} ┃ #{@board[2]}"
        puts "━━━╋━━━╋━━━"
        puts " #{@board[3]} ┃ #{@board[4]} ┃ #{@board[5]}"
        puts "━━━╋━━━╋━━━"
        puts " #{@board[6]} ┃ #{@board[7]} ┃ #{@board[8]}"
    end
    def play
        display_board
        puts "Enter name for player1:"
        player_name = gets.chomp
        @player_1 = Player.new(player_name)
        puts "Enter name for player2:"
        player_name = gets.chomp
        @player_2 = Player.new(player_name)
        puts "#{@player_1.name} choose a symbol:"
        symbol = gets.chomp.upcase
        valid_symbols = ["X", "O"]
        while !valid_symbols.include?(symbol)
           puts "Wrong choice! You need to choose either X or O."
           puts "#{@player_1.name} please choose a valid symbol:"
           symbol = gets.chomp.upcase
        end
        @player_1.symbol = symbol
        @player_1.symbol == "X" ? @player_2.symbol = "O" : @player_2.symbol = "X"
        print "#{@player_1.name} your symbol is #{@player_1.symbol} and "
        puts "#{@player_2.name} your symbol is #{@player_2.symbol}"
        while !over?
            if(@turns%2 !=0)
              move(@player_1)
            else
              move(@player_2)
            end
        end

    end
    def move(player)
        puts "#{player.name} please choose the position to put your symbol: "
        choice = gets.chomp.to_i
        while (!@board.include?(choice)) || (!@board[choice-1].is_a? Integer)
           puts "Wrong choice! You need to choose a number between 1  and 9 that is available on the board."
           display_board
           puts "#{player.name} please choose a valid position: "
           choice = gets.chomp.to_i
        end
        @turns += 1
        @board[choice-1] = player.symbol
        player.moves << choice
        display_board
    end
    def over?
       if line?
         puts "#{@turns % 2 == 1 ? "#{@player_2.name}" : "#{@player_1.name}"} won!"
         return true
       elsif @turns > 9
         puts "It's a tie!"
         return true
       else
         return false
       end
    end
    def line?
      lines = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
      (@player_1.moves.permutation(3).to_a & lines).length > 0 or (@player_2.moves.permutation(3).to_a & lines).length > 0
    end
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
    board = [1,2,3,4,5,6,7,8,9]
    game = Game.new(board)
    game.play
    puts "Press any key to play again or press 'Q' to quit:"
    choice = gets.chomp.upcase
    break if choice == "Q"
    system "clear"
end
