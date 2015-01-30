#My first Calculator

#### ASK USER FOR CALCULATOR ACTION

begin
puts "Welcome to the Calculator. What function would you like to do? Put ADD, SUBTRACT, MULTIPLY, or DIVIDE"
user_action = gets.chomp
end until ["ADD", "SUBTRACT", "MULTIPLY", "DIVIDE"].include?(user_action)

def add_function(number1, number2)
  answer1 = number1.to_f + number2.to_f
  puts "The answer to your calculation is #{answer1}"
end

def subtract_function(number1, number2)
  answer2 = number1.to_f - number2.to_f
  puts "The answer to your calculation is #{answer2}"
end

def multiply_function(number1, number2)
  answer3 = number1.to_f * number2.to_f
  puts "The answer to your calculation is #{answer3}"
end

def divide_function(number1, number2)
  answer4 = number1.to_f / number2.to_f  
  puts "The answer to your calculation is #{answer4}"
end

case user_action
  when "ADD"
    puts "What two numbers would you like to add? Please put your first number."
    number1 = gets.chomp
    puts "Thank you. Now put your second number."
    number2 = gets.chomp
    add_function(number1, number2)
  when "SUBTRACT"
    puts "What two numbers would you like to subtract? Please put your first number."
    number1 = gets.chomp
    puts "Thank you. Now put your second number, or the number you would like to subtract from the first number."
    number2 = gets.chomp
    subtract_function(number1, number2)
  when "MULTIPLY"
    puts "What two numbers would you like to multiply? Please put your first number."
    number1 = gets.chomp
    puts "Thank you. Now put your second number."
    number2 = gets.chomp
    multiply_function(number1, number2)
  when "DIVIDE"
    puts "What two numbers would you like to divide? Please put your first number, the number you'd like to divide from (or numerator)."
    number1 = gets.chomp
    puts "Thank you. Now put your second number, which you'll divide your first number by (the denominator)."
    number2 = gets.chomp
    divide_function(number1, number2)
  else
    puts "I am sorry, but you'll need to retype that.  Try ADD, SUBTRACT, MULTIPLY, or DIVIDE"
  end






