#PRACTICE

#Passing in a refernence by value:

def my_non_mutate_method(array)
  array.uniq
  puts array
end


def my_mutate_method(array)
  array.uniq!
  puts array
end

my_array = [1, 2, 3, 3, 5, 5]

my_non_mutate_method(my_array)

my_mutate_method(my_array)