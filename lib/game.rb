class Game
    attr_reader :player_1, :player_2 
    attr_accessor :turns, :game_board
    def initialize(player_1, player_2, board)
        @turns = 1
        @game_board = board
        @player_1 = player_1
        @player_2 = player_2
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