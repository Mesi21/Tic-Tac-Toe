require_relative "../lib/ui.rb"
class Board
    attr_reader :board
    def initialize(board)
        @board = board
    end
    include UserInterface
    def full?
       @board.all? { |a| a.is_a? String }
    end
    def is_valid?(index)
        @board[index].is_a? Integer
    end
    def fill_pos(pos, symbol)
        @board[pos] = symbol
    end
end