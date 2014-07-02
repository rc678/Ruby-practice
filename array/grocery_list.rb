=begin
Practice with arrays
-------------------------------------
Program that makes a grocery list
Will constantly ask for items until 
sentinel value is entered
=end

user_input = ""
list = Array.new()

#adds item to array
while user_input != "+" do
puts "Enter what you need to do today. Exit by pressing +."
user_input = gets.chomp
list.push(user_input)
end

#removes + and prints list
puts "Your Grocery list"
puts "-----------------" 
list.pop
puts list
