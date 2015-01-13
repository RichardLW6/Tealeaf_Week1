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
    |   " + spaces[0] + "   |   " + spaces[1] + "   |   " + spaces[2] + "   |
    |_______|_______|_______|
    |   4   |   5   |   6   |
    |   " + spaces[3] + "   |   " + spaces[4] + "   |   " + spaces[5] + "   |
    |_______|_______|_______|
    |   7   |   8   |   9   |
    |   " + spaces[6] + "   |   " + spaces[7] + "   |   " + spaces[8] + "   |
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

#Computer checks to see if there is a winning move

def computer_offense_check(spaces, space1, space2, space3)

  ((spaces[space1] + spaces[space2]).include?("OO") ||
  (spaces[space2] + spaces[space3]).include?("OO") || 
  (spaces[space1] + spaces[space3]).include?("OO")) && 
  (spaces[space1] + spaces[space2] + spaces[space3]).include?("X") == false

end

#Computer checks to see if it needs to make a defensive move

def computer_defense_check(spaces, space1, space2, space3)

  ((spaces[space1] + spaces[space2]).include?("XX") || 
  (spaces[space2] + spaces[space3]).include?("XX") || 
  (spaces[space1] + spaces[space3]).include?("XX")) && 
  (spaces[space1] + spaces[space2] + spaces[space3]).include?("O") == false

end

#Computer makes a key move, on offense or defense, adding a "O" to the board

def computer_key_move(spaces, check1, check2, check3)

  if spaces[check1] == " "
    spaces[check1] = "O"
  elsif spaces[check2] == " "
    spaces[check2] = "O"
  elsif spaces[check3] == " "
    spaces[check3] = "O"
  end
end

#---------------------BEGINNING OF GAME LOOP-------------------#

begin

  #Welcome message

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

    begin

      puts "\nPlease enter one of the numbers above to place your mark.\n\n"
      user_choice = gets.chomp.to_i
      if board_spaces[user_choice - 1] == "O" || board_spaces[user_choice - 1] == "X"
        puts "That space is already taken.\n"
      end
    end until [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(user_choice) && board_spaces[user_choice - 1] != "O" && board_spaces[user_choice - 1] != "X"

    board_spaces[user_choice - 1] = "X"

    turn_number += 1

    if winner_checker(board_spaces) != false
      break
    end

    show_board(board_spaces)

    puts "\nThe computer chooses...\n"

      # COMPUTER OFFENSE

      #Tells computer to win horizontal spaces

      if computer_offense_check(board_spaces, 0, 1, 2)

        computer_key_move(board_spaces, 0, 1, 2)

      elsif computer_offense_check(board_spaces, 3, 4, 5)

        computer_key_move(board_spaces, 3, 4, 5)

      elsif computer_offense_check(board_spaces, 6, 7, 8)

        computer_key_move(board_spaces, 6, 7, 8)

      #Tells computer to win vertical spaces

      elsif computer_offense_check(board_spaces, 0, 3, 6) 

        computer_key_move(board_spaces, 0, 3, 6)

      elsif computer_offense_check(board_spaces, 1, 4, 7) 

        computer_key_move(board_spaces, 1, 4, 7)

      elsif computer_offense_check(board_spaces, 2, 5, 8)

        computer_key_move(board_spaces, 2, 5, 8)

      #Tells computer to win diagonal spaces

      elsif computer_offense_check(board_spaces, 0, 4, 8)

        computer_key_move(board_spaces, 0, 4, 8)

      elsif computer_offense_check(board_spaces, 2, 4, 6)

        computer_key_move(board_spaces, 2, 4, 6)

      # COMPUTER DEFENSE

      #Tells computer to counter horizontal spaces

      elsif computer_defense_check(board_spaces, 0, 1, 2)

        computer_key_move(board_spaces, 0, 1, 2)

      elsif computer_defense_check(board_spaces, 3, 4, 5)

        computer_key_move(board_spaces, 3, 4, 5)

      elsif computer_defense_check(board_spaces, 6, 7, 8)

        computer_key_move(board_spaces, 6, 7, 8)


      #Tells computer to counter vertical spaces

      elsif computer_defense_check(board_spaces, 0, 3, 6)

        computer_key_move(board_spaces, 0, 3, 6)

      elsif computer_defense_check(board_spaces, 1, 4, 7)

        computer_key_move(board_spaces, 1, 4, 7)

      elsif computer_defense_check(board_spaces, 2, 5, 8)

        computer_key_move(board_spaces, 2, 5, 8)

      #Tells computer to counter diagonal spaces

      elsif computer_defense_check(board_spaces, 0, 4, 8)

        computer_key_move(board_spaces, 0, 4, 8)

      elsif computer_defense_check(board_spaces, 2, 4, 6)

        computer_key_move(board_spaces, 2, 4, 6)

      else
        while true
          computer_choice = (rand(9))
          computer_corner = (rand(4))

          computer_corner_choosing = [0, 2, 6, 8]

          if turn_number >= 9
            break


          elsif board_spaces[4] == " "
            board_spaces[4] = "O"
            break

          elsif (board_spaces[0] == " " || board_spaces[2] == " " || board_spaces[6] == " " || board_spaces[8] == " ") && (board_spaces[computer_corner_choosing[computer_corner]] == " ")
          
            board_spaces[computer_corner_choosing[computer_corner]] = "O"
            break

          elsif board_spaces[computer_choice] != "O" && board_spaces[computer_choice] != "X"
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

  #Showing who the winner is, and also showing the last phase of the board

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

  #Ask to End or Start a New Game

  begin
    puts "Would you like to play again? Y/N"
    game_continue = gets.chomp.downcase
    if game_continue != "y" && game_continue != "n"
      puts "Please put in 'Y' for YES, or 'N' for NO."
    end
  end until game_continue == "y" || game_continue == "n"

end until game_continue == "n"


#---------------------END OF GAME-------------------#







