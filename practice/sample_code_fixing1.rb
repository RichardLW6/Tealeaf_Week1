# Ruby Calculator Assignment
# Integer Math Only

#Methods to validate user input
def valid_int?(num)
  !/^\d+$/.match(num).nil?
end

def valid_operator?(num)
  !/^[1-4]$/.match(num).nil?
end

####### MY EDIT: Add in a new method that puts the "=>" on the quotes.
def says(quote)
  puts "==> " + quote
end

#Methods to get user input
def get_num
  says "Enter an Integer"
  num = gets.chomp
  while !valid_int?(num)
    says "Try again, Integer input please"
    num = gets.chomp
  end
  num.to_i
end

def get_operator
  says "Pick an Operator by Number"
  says "1) Addition (+), 2) Subtraction (-), 3) Multiplication (x), 4) Division (/)"
  operator = gets.chomp
  while !valid_operator?(operator)
    says "Try again, Input 1,2,3 or 4"
    says "1) Addition (+), 2) Subtraction (-), 3) Multiplication (x), 4) Division (/)"
    operator = gets.chomp
  end
  operator.to_i
end

# Main Calculator Program
puts "Try the amazing integer calculator!!"
num1 = get_num
operator = get_operator
num2 = get_num

#Array of operators for display only
operators=["+","-","x","/"]

case operator
when 1
  result = num1 + num2
when 2 
  result = num1 - num2
when 3
  result = num1 * num2
when 4
  if num2 == 0
    result = "ERROR: Can't divide by 0"
  else
    result = num1.to_f / num2.to_f
  end
end

puts "#{num1} #{operators[operator - 1]} #{num2} = #{result}"

