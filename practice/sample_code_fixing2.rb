help =
  "\nA simple calculator that performs addition, subtraction, multiplication,\n" +
  "or division. Enter your numbers at the prompt and receive the answer.\n" +
  "Note that you may want to enter decimal numbers in some cases.\n\n"

puts help

def int_or_float(user_number)
  if user_number =~ /\d+\.\d+/
    user_number.to_f
  else
    user_number.to_i
  end
end

operation_checker = ["1", "2", "3", "4"]

while true
  puts "Enter a integer or decimal number:"
  num1 = int_or_float(gets.chomp)

  puts "Enter an integer or decimal number:"
  num2 = int_or_float(gets.chomp)

  puts "Which operation would you like to perform?
       \n  1. Addition
       \n  2. Subtraction
       \n  3. Division
       \n  4. Multiplication
       \n-----------------------------------------"

  operation_type = gets.chomp.to_i

  if operation_checker.include?(operation_type) == false
    puts "That operation is unknown. Try again? (y/n)"
    ans = gets.chomp
    if ans = 'y'
      next
    else
      break
    end
  else
    case
    when operation_type == 1
      puts "The sum of #{num1} and #{num2} is #{num1 + num2}"
    when operation_type == 2
      puts "The difference of #{num1} and #{num2} is #{num1 - num2}"
    when operation_type == 3
      if num2 == 0
        puts "You can't divide by zero. Error!"
      else
        puts "The quotient of #{num1} and #{num2} is #{num1 / num2}"
      end
    when operation_type == 4
      puts "The product of #{num1} and #{num2} is #{num1 * num2}" 
    end
  end

  puts "\nWould you like another calculation? (y/n)"
  again = gets.chomp
  if again == 'y'
    next
  else
    break
  end
end