#MY FIRST TRY - TIC TAC TOE

#1. Decide which player goes first
#2. First player decides to be X or O
#3. Tic Tac Toe Board appears, numbers in each of nine "Spaces"
#4. Player 1 chooses which space (or number) to put their mark
#5. Player 2 chooses which space (or number) to put their mark
#6. The first player with three of their marks in a row wins

require 'pry'

# Showing the board and its current state

def show_board(spaces)
puts "\n

     _______ _______ _______   
    |   1   |   2   |   3   |
    |  " + spaces[0] + "    |  " + spaces[1] + "    |   " + spaces[2] + "   |
    |_______|_______|_______|
    |   4   |   5   |   6   |
    |  " + spaces[3] + "    |  " + spaces[4] + "    |   " + spaces[5] + "   |
    |_______|_______|_______|
    |   7   |   8   |   9   |
    |  " + spaces[6] + "    |  " + spaces[7] + "    |   " + spaces[8] + "   |
    |_______|_______|_______|   \n\n\n"

end


# Checking to see if either player has won the match (3 spaces in a row)

def winner_checker(spaces)

  computer_wins_game = ["O", "O", "O"]
  player_wins_game = ["X", "X", "X"]

  if (spaces[0..2] == computer_wins_game) || (spaces[3..5] == computer_wins_game) || (spaces[6..8] == computer_wins_game) || (spaces[0] + spaces[3] + spaces[6] == "OOO") || (spaces[1] + spaces[4] + spaces[7] == "OOO") || (spaces[2] + spaces[5] + spaces[8] == "OOO") || (spaces[0] + spaces[4] + spaces[8] == "OOO") || (spaces[2] + spaces[4] + spaces[6] == "OOO")

    1

  elsif (spaces[0..2] == player_wins_game) || (spaces[3..5] == player_wins_game) || (spaces[6..8] == player_wins_game) || (spaces[0] + spaces[3] + spaces[6] == "XXX") || (spaces[1] + spaces[4] + spaces[7] == "XXX") || (spaces[2] + spaces[5] + spaces[8] == "XXX") || (spaces[0] + spaces[4] + spaces[8] == "XXX") || (spaces[2] + spaces[4] + spaces[6] == "XXX")
    
    2

  else

    false
  end
end





def computer_counter_move(spaces, check1, check2, check3)

  if spaces[check1] == " "
    spaces[check1] = "O"
  elsif spaces[check2] == " "
    spaces[check2] = "O"
  elsif spaces[check3] == " "
    spaces[check3] = "O"
  end
end




#Welcome message.
puts "\nWelcome to Tic Tac Toe!\n"

#Choose "heads" or "tails"

coin = ["h", "t"]

begin
  puts "We are flipping a coin to see who goes first.
      \nPlease choose Heads (H) or Tails (T):"

  coin_flip_guess = gets.chomp.downcase

end while coin.include?(coin_flip_guess) == false



#Flip a coin - if chosen correct, user can choose to go first or second.  If not, computer randomly chooses.

coin_flip_result = coin.sample

coin_flip_win = 0

#Changing 'h' and 't' to 'Heads' and 'Tails'

def coin_flip_spelled_out(coin)
  if coin == "h"
    coin = "Heads"
  elsif coin == "t"
    coin = "Tails"
  end
end

coin_flip_spelled_out(coin_flip_result)
coin_flip_spelled_out(coin_flip_guess)


#Putting out results of coin flip
if coin_flip_result == coin_flip_guess
  puts "You guessed " + coin_flip_spelled_out(coin_flip_guess) + ". The flip was " + coin_flip_spelled_out(coin_flip_result) + ". You win the toss!"
  coin_flip_win = 1
else
  puts "You guessed " + coin_flip_spelled_out(coin_flip_guess) + ". The flip was " + coin_flip_spelled_out(coin_flip_result) + ". You lose the toss!"
end


board_spaces = [" ", " ", " ", " ", " ", " ", " ", " ", " "]





turn_number = 0


if coin_flip_win != 1
    puts "\nThe computer goes first..."
    board_spaces[4] = "O"
    turn_number += 1
    
end

  show_board(board_spaces)
  

begin


  winner_checker(board_spaces)

  

  puts "\nPlease enter one of the numbers above to place your mark.\n\n"
  user_choice = gets.chomp.to_i

  board_spaces[user_choice - 1] = "X"

  turn_number += 1

  if winner_checker(board_spaces) != false
    break
  end

  show_board(board_spaces)

  puts "\nThe computer chooses...\n"

  # while true

    #Tells computer to win horizontal spaces

    if board_spaces[0..2].join.include?("OO ") || board_spaces[0..2].join.include?("O O") || board_spaces[0..2].join.include?(" OO") && board_spaces[0..2].include?("X") == false

      board_spaces[0..2] = ["O", "O", "O"]

      binding.pry

    elsif board_spaces[3..5].join.include?("OO ") || board_spaces[3..5].join.include?("O O") || board_spaces[3..5].join.include?(" OO") && board_spaces[3..5].include?("X") == false

      board_spaces[3..5] = ["O", "O", "O"]

      binding.pry

    elsif board_spaces[6..8].join.include?("OO ") || board_spaces[6..8].join.include?("O O") || board_spaces[6..8].join.include?(" OO") && board_spaces[6..8].include?("X") == false

      board_spaces[6..8] = ["O", "O", "O"]

      binding.pry

    #Tells computer to win vertical spaces

    elsif (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?(("OO ") || ("O O") || (" OO")) && (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?("X") == false

      board_spaces[0] = "O"
      board_spaces[3] = "O"
      board_spaces[6] = "O"

      binding.pry

    elsif (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?(("OO ") || ("O O") || (" OO")) && (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?("X") == false

      board_spaces[1] = "O"
      board_spaces[4] = "O"
      board_spaces[7] = "O"

      binding.pry

    elsif (board_spaces[2] + board_spaces[5] + board_spaces[8]).include?(("OO ") || ("O O") || (" OO")) && (board_spaces[2] + board_spaces[5] + board_spaces[8]).include?("X") == false

      board_spaces[2] = "O"
      board_spaces[5] = "O"
      board_spaces[8] = "O"

      binding.pry

    #Tells computer to win diagonal spaces

    elsif (board_spaces[0] + board_spaces[4] + board_spaces[8]).include?(("OO ") || ("O O") || (" OO")) && (board_spaces[0] + board_spaces[4] + board_spaces[8]).include?("X") == false

      board_spaces[0] = "O"
      board_spaces[4] = "O"
      board_spaces[8] = "O"

      binding.pry

    elsif (board_spaces[2] + board_spaces[4] + board_spaces[6]).include?(("OO ") || ("O O") || (" OO")) && (board_spaces[2] + board_spaces[4] + board_spaces[6]).include?("X") == false

      board_spaces[2] = "O"
      board_spaces[4] = "O"
      board_spaces[6] = "O"

      binding.pry

    ############ADDING COMPUTER DEFENSE

    #Tells computer to counter horizontal spaces

    elsif board_spaces[0..2].join.include?("XX ") || board_spaces[0..2].join.include?("X X") || board_spaces[0..2].join.include?(" XX") && board_spaces[0..2].include?("O") == false

      computer_counter_move(board_spaces, 0, 1, 2)

      binding.pry

    elsif board_spaces[3..5].join.include?("XX ") || board_spaces[3..5].join.include?("X X") || board_spaces[3..5].join.include?(" XX") && board_spaces[3..5].include?("O") == false

      computer_counter_move(board_spaces, 3, 4, 5)

      binding.pry

    elsif board_spaces[6..8].join.include?("XX ") || board_spaces[6..8].join.include?("X X") || board_spaces[6..8].join.include?(" XX") && board_spaces[6..8].include?("O") == false

      computer_counter_move(board_spaces, 6, 7, 8)

      binding.pry

    #Tells computer to counter vertical spaces

    elsif (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?("XX ") || (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?("X X") || (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?(" XX") && (board_spaces[0] + board_spaces[3] + board_spaces[6]).include?("O") == false

      computer_counter_move(board_spaces, 0, 3, 6)

      binding.pry

    elsif (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?("XX ") || (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?("X X") || (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?(" XX") && (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?("O") == false

      computer_counter_move(board_spaces, 1, 4, 7)

      binding.pry

    elsif (board_spaces[2] + board_spaces[5] + board_spaces[8]).include?("XX ") || (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?("X X") || (board_spaces[1] + board_spaces[4] + board_spaces[7]).include?(" XX") && (board_spaces[2] + board_spaces[5] + board_spaces[8]).include?("O") == false

      computer_counter_move(board_spaces, 2, 5, 8)

      binding.pry

    #Tells computer to counter diagonal spaces

    elsif (board_spaces[0] + board_spaces[4] + board_spaces[8]).include?(("XX ") || ("X X") || (" XX")) && (board_spaces[0] + board_spaces[4] + board_spaces[8]).include?("O") == false

      computer_counter_move(board_spaces, 0, 4, 8)

      binding.pry

    elsif (board_spaces[2] + board_spaces[4] + board_spaces[6]).include?(("XX ") || ("X X") || (" XX")) && (board_spaces[2] + board_spaces[4] + board_spaces[6]).include?("O") == false

      computer_counter_move(board_spaces, 2, 4, 6)

      binding.pry

    else
      while true
        computer_choice = (rand(9))

        if board_spaces[computer_choice] != "O" and board_spaces[computer_choice] != "X"
          board_spaces[computer_choice] = "O"
          break
        else
      end

    end

    

  end

  show_board(board_spaces)

  turn_number += 1

  winner_checker(board_spaces)

end while winner_checker(board_spaces) == false && turn_number < 9


if winner_checker(board_spaces) == 1
  show_board(board_spaces)
  puts "\n\nComputer Wins!\n\n"
elsif winner_checker(board_spaces) == 2
  show_board(board_spaces)
  puts "\n\nPlayer Wins! - Congratulations!\n\n"
else
  show_board(board_spaces)
  puts "\n\nIt's a Tie! You are both, unfortunately, idiots.\n\n"
end









