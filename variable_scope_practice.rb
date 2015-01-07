
#PRACTICE 1

#re-assigning variable to something else

local_variable = [1,2,3]

loop do
  local_variable = [1,2,3,4,5]
  break
end


puts local_variable


#call a method that doesn't mutate the caller


local_variable2 = [1,2,3]

def my_method1(array)
  array = [1]
end

my_method1(local_variable2)

puts local_variable2


#call a method that mutates the caller

local_variable3 = [1,1,2,2,3,3]

def my_method2(array)
  array.uniq!
end

my_method2(local_variable3)

puts local_variable3


#PRACTICE 2

#create local variable at inner scope and try to reference it at outer scope


loop do
  local_variable4 = 6
  break
end

#it causes an error because there was no outer scope variable to be referenced
puts local_variable4

#another example

def my_method3
  local_variable5 = 99
end

my_method3

#same as above - causes error because no outer scope variable first defined
puts local_variable5


#PRACTICE 3 

#Question: How do variable scope rules pertain to methods?

#Answer: 
#First, methods - unlike blocks - do not automatically change variables when they are assigned by value
#Second, you cannot refer to a new variable within a method (inner scope) and not have it previously defined first in the outer method.
#Third, methods only care about variables passed in as arguments

x = “hi”

def my_method4
  puts x
end

my_method4
