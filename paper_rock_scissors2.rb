#PAPER/ROCK/SCISSORS APPLICATION

puts "Play Paper Rock Scissors!"

choices_short = ['p', 'r', 's']
choices_long = ["Paper", "Rock", "Scissors"]

computer_score = 0
user_score = 0

def winning_message(winning_answer)
  case winning_answer
  when 'Paper'
    puts "Paper wraps itself around the Rock and crushes it to death!"
  when 'Rock'
    puts "Rock demolishes the scissors and batters them to pieces!"
  when 'Scissors'
    puts "Scissors slice the Paper into tiny, painful little shreds!"
  end
end

while true
  begin
  puts "Choose one: (P/R/S)"
  user_answer = gets.chomp.downcase
  end until choices_short.include?(user_answer)

  computer_answer = choices_long[rand(choices_long.length)]

  case user_answer
  when 'p'
    user_answer = "Paper"
  when 'r'
    user_answer = "Rock"
  when 's'
    user_answer = "Scissors"
  end

  #Declaring who picked what
  puts "You picked #{user_answer} and the Computer picked #{computer_answer}."

  #FIGURING OUT THE OUTCOMES

  #Tie Game
  if user_answer == computer_answer
    puts "It is a tie!"

  #Player wins
  elsif (user_answer == 'Paper' && computer_answer == 'Rock') || (user_answer == 'Rock' && computer_answer == 'Scissors' || user_answer == 'Scissors' && computer_answer == 'Paper')
    winning_message(user_answer)
    user_score += 1

  #Computer wins
  else
    winning_message(computer_answer)
    computer_score += 1
  end

  puts "Current Score: \n You: #{user_score}\n Computer: #{computer_score}"
  
  #Give option to Play Again, or Stop
  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'
  
end
