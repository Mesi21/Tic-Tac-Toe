module UserInterface
    def display_board
        puts " #{board.fields[0]} ┃ #{board.fields[1]} ┃ #{board.fields[2]}"
        puts "━━━╋━━━╋━━━"
        puts " #{board.fields[3]} ┃ #{board.fields[4]} ┃ #{board.fields[5]}"
        puts "━━━╋━━━╋━━━"
        puts " #{board.fields[6]} ┃ #{board.fields[7]} ┃ #{board.fields[8]}"
    end

    def play(current_player)
      loop do
        puts "#{current_player.name} enter your move"
        choice = gets.chomp.to_i
        if (1..9).cover?(choice)
          if !board.is_free?(choice-1)
            puts 'Already occupied! Please enter another choice!'
          else
            current_player.update(choice-1, board)
            break
          end
        else
          puts 'Enter a valid number'
        end
      end
      true
    end

    def display_winner(player_name)
      display_board
      puts "#{player_name} has won!"
    end

    def is_draw
       puts "Game over! It's a tie!" if game_over?
    end
end
