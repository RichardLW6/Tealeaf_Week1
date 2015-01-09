# 1. All players pick either paper, rock, or scissors
# 2. We compare.  Paper > Rock, Rock > Scissors, Scissors > Paper, or Tie if it is the Same.
# 3. Play again?


CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to Paper, Rock, Scissors!"

computer_score = 0
user_score = 0


def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper wraps Rock!"
  when 'r'
    puts "Rock smashes Scissors"
  when 's'
    puts "Scissors cuts Paper!"
  end
end

loop do
  # player makes a pick
  begin
    puts "Pick one: (p, r, s):"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts "It's a tie!"
  
  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')

    display_winning_message(player_choice)
    puts "You won!"
  
  else

    display_winning_message(computer_choice)
    puts "Computer won!"
  end

  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'


end

puts "Good bye!"







