class Player
    attr_reader :name, :symbol, :moves
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
        @moves = []
    end
    def update(choice,board)
        moves << choice
        board.fields[choice] = symbol
    end
end