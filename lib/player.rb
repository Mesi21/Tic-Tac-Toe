require_relative "../lib/ui.rb"
class Player
    attr_reader :name, :symbol, :moves
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @moves = []
    end
    include UserInterface
end