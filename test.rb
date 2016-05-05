require 'pry'

# write a method that takes string as an argument and return the string in reverse order

# def reverse_str (str)
#   new_arr = []
#   old_arr = str.split # ["What", "you", "got", "there?"]
#   old_arr.each do |word|
#     new_word = []
#     word = word.split("")  # ["W", "h", "a", "t"]
#     word.length.times { new_word << word.pop }
#     new_arr << new_word.join
#   end
#   final_arr = []
#   new_arr.count.times do 
#     final_arr << new_arr.pop
#   end 
#   final_arr.join(" ")
# end

# p reverse_str("What you got there?")

# p "What you got there?".reverse

# def fizzbuzz (num1, num2)
#   output = ""
#   loop do 
#     if num1 % 3 == 0 && num1 % 5 == 0
#       output += "FizzBuzz, "
#     elsif num1 % 3 == 0
#       output += "Fizz, "
#     elsif num1 % 5 == 0
#       output += "Buzz, "
#     else
#       output += num1.to_s + ", "
#     end
#   num1 += 1  
#   break if num1 == num2
#   end 

#   if num1 % 3 == 0 && num1 % 5 == 0
#       output += "FizzBuzz"
#   elsif num1 % 3 == 0
#     output += "Fizz"
#   elsif num1 % 5 == 0
#     output += "Buzz"
#   else
#     output += num1.to_s 
#   end

#   output
# end


# p fizzbuzz(1, 15)


# iterate through each product within Array PRODUCTS
  # match the name of the laptop 
  # then match the price that falls within the range
# output the result in array of hash(es) or none if applicable

# PRODUCTS = [
#   { name: "Thinkpad x210", price: 220 },
#   { name: "Thinkpad x220", price: 250 },
#   { name: "Thinkpad x230", price: 300 },
#   { name: "Dell Latitude", price: 200 },
#   { name: "Dell Inpsiron", price: 450 },
#   { name: "Dell Inspiron", price: 450 }
# ]

# query = {
#   price_min: 240,
#   price_max: 280,
#   q: "thinkpad"
# }

# query2 = {
#   price_min: 300,
#   price_max: 450,
#   q: 'dell'
# }

# def search(query)
#   output = []
#   PRODUCTS.each do |item|  # { name: "Thinkpad x210", price: 220 }
#     if item[:name].match(query[:q].capitalize) && item[:price].between?(query[:price_min], query[:price_max])
#       output << item 
#     else
#       next
#     end
#   end
#   return output unless output.empty? 
#   nil
# end

# p search(query) # [ { name: "Thinkpad x220", price: 250 }]

# #search(query2) # [ { name: "Dell Inspiron", price: 300 }, { name: "Dell Insipiron", price: 450 }]

# test_array = ["green", "yellow", "black", "white"]

# def remove_vowels(msg) # ["green", "yellow", "black", "white"]
#   msg.map do |word|   # "green"
#     word = word.split("").select do |letter|  #['g', 'r', 'e', 'e', 'n']
#       !/[aeiou]/.match(letter)
#     end
#     word.join
#   end
# end

# p remove_vowels(test_array)

# def balancer(msg)
#   left_bracket_count = msg.count("(")
#   right_bracket_count = msg.count(")")
#   return true if left_bracket_count == right_bracket_count && (msg.index("(").to_i <= msg.index(")").to_i)
#   false
# end

# p balancer("hi")
# p balancer("(hi")
# p balancer("(hi)")
# p balancer(")hi(")



# find numbers between that range that could only be divided 1 and by itself
# divide the number by iterating through all the numbers less than the chosen number and see if anything results in zero 

# def find_primes(num1, num2)
#   result = []
#   (num1..num2).each do |num|
#     i = 2
#     while i < num do
#       if num % i != 0
#         i += 1
#       else
#         break
#       end
#     end
#     result << num if i == num
#   end  
#   result
# end

# p find_primes(3, 25)

# computer_number = rand(100) + 1
# num_guesses = 0

# loop do
#     num_guesses += 1
#     puts "What number do you like to guess between 1 and 100?"
#     user_number = gets.chomp.to_i
#     if computer_number > user_number
#       puts "Your number is too low"
#     elsif computer_number < user_number
#       puts "Your number is too high"
#     else
#       puts "You are a mind reader"
#       break
#     end
# end
  
# puts "you've guessed #{num_guesses} times"



























