#RICHARD'S CALCULATOR

#Give directions to the user. 1) ADD, 2) SUBTRACT, 3) MULTIPLY, 4) DIVIDE

message = "Welcome to the Calculator. 1) ADD, 2) SUBTRACT, 3) MULTIPLY, 4) DIVIDE:"

while true
  puts message
  directions = gets.chomp
  directions = directions.to_i
  message = "That was not a choice. Please put one of the following commands: 1) ADD, 2) SUBTRACT, 3) MULTIPLY, 4) DIVIDE:"
  #Check to make sure the submission is correct
  if (directions == 1 || directions == 2 || directions == 3 || directions == 4)
    break
  end
end

#Gets the first number
puts "Please put in the first number:"
number1 = gets.chomp

#Gets the second number
puts "Please put in the second number:"
number2 = gets.chomp

#Sorting directions to take actions in calculator
case directions
  #Addition
  when 1
    answer = number1.to_i + number2.to_i
    puts "#{number1} plus #{number2} is equal to #{answer}"

  #Subtraction
  when 2
    answer = number1.to_i - number2.to_i
    puts "#{number1} minus #{number2} is equal to #{answer}"

  #Multiply
  when 3
    answer = number1.to_i * number2.to_i
    puts "#{number1} times #{number2} is equal to #{answer}"

  #Division
  when 4
    answer = number1.to_f / number2.to_f
    puts "#{number1} divided by #{number2} is equal to #{answer}"
end