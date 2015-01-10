CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors' }

puts "Let's play 'Rock, Paper, Scissors!'"

loop do
  # player chooses
  begin
    puts "Please choose [r] for Rock, [p] for Paper, or [s] for Scissors."
    user_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(user_choice)

  # the computer chooses
  computer_choice = CHOICES.keys.sample

  # determine who won

  if user_choice == computer_choice
    puts "It's a tie!"
  elsif (user_choice == 'r' && computer_choice == 's') || (user_choice == 'p' && computer_choice == 'r') || (user_choice == 's' && computer_choice == 'p')
    puts "You: " + CHOICES[user_choice] + " | Me: " + CHOICES[computer_choice]
    puts "You win!"
  else
    puts "Me: " + CHOICES[computer_choice] + " | You: " + CHOICES[user_choice]
    puts "Sorry, you lose..."
  end

  puts "Would you to play again? (y/n)"
  break if gets.chomp.downcase != 'y'

end

puts "Thanks for playing!"