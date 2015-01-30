#My first Calculator

#### GETTING TWO NUMBERS TO CALCULATE FROM USER

def gets_numbers
  numbers = []
  puts "What will the first number be?"
  numbers.push(gets.chomp)
  puts "What will the second number be?"
  numbers.push(gets.chomp)
  numbers
end

#### ASK USER FOR CALCULATOR ACTION

begin
puts "Welcome to the Calculator. What function would you like to do? Put the number for (1) ADD, (2) SUBTRACT, (3) MULTIPLY, or (4) DIVIDE"
user_action = gets.chomp
end until ["1", "2", "3", "4"].include?(user_action)

#### PERFORM THE 4 DIFFERENT CALCULATIONS

case user_action
  when "1"
    number_array = gets_numbers
    answer = number_array[0].to_i + number_array[1].to_i
    puts "The answer to your addition problem is #{answer}."
  when "2"
    number_array = gets_numbers
    answer = number_array[0].to_i - number_array[1].to_i
    puts "The answer to your subtraction problem is #{answer}."
  when "3"
    number_array = gets_numbers
    answer = number_array[0].to_i * number_array[1].to_i
    puts "The answer to your multiplication problem is #{answer}."
  when "4"
    number_array = gets_numbers
    answer = number_array[0].to_f / number_array[1].to_f
    puts "The answer to your division problem is #{answer}."
  else
    puts "I am sorry, but you'll need to retype that.  Please type 1 for ADD, 2 for SUBTRACT, 3 for MULTIPLY, or 4 for DIVIDE"
end






