#PAPER/ROCK/SCISSORS APPLICATION


puts "Play Paper Rock Scissors!"

choices = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

computer_score = 0
user_score = 0

while true
  begin
  puts "Choose one: (P/R/S)"
  user_answer = gets.chomp.downcase
  end until choices.keys.include?(user_answer)

  computer_answer = choices.keys.sample

  #Convert the choices into real words

  #Converting User Choice
  case user_answer
    when "p"
      user_answer = "Paper"

    when "r"
      user_answer = "Rock"

    when "s"
      user_answer = "Scissors"
  end

  #Converting Computer Choice
  case computer_answer
    when "p"
      computer_answer = "Paper"

    when "r"
      computer_answer = "Rock"

    when "s"
      computer_answer = "Scissors"
  end

  #Declaring who picked what
  puts "You picked #{user_answer} and the computer picked #{computer_answer}."

  #FIGURING OUT THE OUTCOMES

  #Both choices are equal
  if user_answer == computer_answer
    puts "Both sides have chosen the same thing. \nIt's a tie!"  

  #User chooses Paper
  elsif user_answer == "Paper"
    if computer_answer == "Rock"
      puts "You wrap the Computer's Rock in wads of Paper. \nYou win!"
      user_score += 1
    else
      puts "The Computer cuts your Paper into shreds. \nYou lose!"
      computer_score += 1
    end 

  #User chooses Scissors
  elsif user_answer == "Scissors"
    if computer_answer == "Rock"
      puts "The Computer smashes your Scissors to pieces. \nYou lose!"
      computer_score += 1
    else
      puts "You cut the Computer's Paper to shreds. \nYou win!"
      user_score += 1
    end

  #User chooses Rock
  elsif user_answer == "Rock"
    if computer_answer == "Scissors"
      puts "You smash the Computer's Scissors to pieces. \nYou win!"
      user_score += 1
    else
      puts "The Computer wraps your Rock in wads of Paper. \nYou lose!"
      computer_score += 1
    end
  end
  puts "Current Score: \n You: #{user_score}\n Computer: #{computer_score}"
  #Give option to Play Again, or Stop
  puts "Play again? (Y/N)"
  break if gets.chomp.downcase != 'y'
  
end
