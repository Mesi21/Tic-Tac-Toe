module UserInterface
    def display_board
        puts " #{@board[0]} ┃ #{@board[1]} ┃ #{@board[2]}"
        puts "━━━╋━━━╋━━━"
        puts " #{@board[3]} ┃ #{@board[4]} ┃ #{@board[5]}"
        puts "━━━╋━━━╋━━━"
        puts " #{@board[6]} ┃ #{@board[7]} ┃ #{@board[8]}"
    end
    def move(board)
        puts "#{@name} enter your move"
        choice = gets.chomp.to_i
        if (1..9).cover?(choice)
          if !board.is_valid?(choice-1)
            puts 'Place taken try again'
          else
            choice
          end
        else
          puts 'Enter a valid number'
        end
    end   
end