class Board
    attr_accessor :fields
    def initialize
        @fields = (1..9).to_a
    end
    def full?
       fields.all? { |a| a.is_a? String }
    end
    def is_free?(choice)
       fields[choice].is_a? Integer
    end
    def win?(moves)
        lines = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
        (moves.combination(3).to_a & lines).length > 0
    end
end
