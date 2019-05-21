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
        lines = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7] ]
        (moves.combination(3).to_a & lines).length > 0
    end
end
