#NUMBER 1

my_array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array1.each { |x| p x}


#NUMBER 2

my_array2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array2.each { |x| p x unless x <= 5}


#NUMBER 3

my_array3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

odd_array3 = my_array.select { |x| x unless x % 2 != 1 }

p odd_array3


#NUMBER 4

my_array4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

my_array4 = my_Array.unshift(0).push(11)

p my_array4


#NUMBER 5

my_array4.pop[10]
my_array4.push(3)


#NUMBER 6

my_array4.uniq!

p my_array4


#NUMBER 7

# DONE


#NUMBER 8

hash81 = {:name => 'bob'}

hash82 = {name: 'bob'}


#NUMBER 9

hash9 = {a:1, b:2, c:3, d:4}

p hash9[:b]

hash9[:e] = 5

new_hash9 = 
h.each do |key, value|
 if value < 3.5
  next
  else 
    key value
  end

end

hash9.keep_if { |key, value| value > 3.5}

p hash9


#NUMBER 12

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone_number] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone_number] = contact_data[1][2]

contacts.fetch()


#NUMBER 13

puts "Joe's email is: #{contacts["Joe Smith"][:email]}"
puts "Sally's phone number is: #{contacts["Sally Johnson"][:phone]}"


#NUMBER 14

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

structure = [:email, :address, :phone]

contacts.each do |name, hash|
  structure.each do |field|
    hash[field] = contact_data.shift
  end
end

p contacts


#NUMBER 15

array15 = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

array15.delete_if { |x| x.start_with?('s', 'w')}

p array15


#NUMBER 16


array16 = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |x| x.split }
a.flatten!

p a


#NUMBER 17

#DONE





