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

# module Attack
#   def attack(weapon)
#     puts "attacks with #{weapon}"
#   end
# end

# class SuperHero
#   include Attack

# end

# captain_america = SuperHero.new

# captain_america.attack("shield")

# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def speak
#     "#{name} says Arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{self.name} weights #{self.weight} and is #{self.height} tall"
#   end

# end

# sparky = GoodDog.new('Sparky', '12 inches', '25 lbs')

# puts sparky.name
# puts sparky.speak
# # puts sparky.inspect
# puts sparky.info

# sparky.change_info('Spartacus', '20 inches', '60 lbs')
# puts sparky.info

# class MyCar
#   attr_accessor :color
#   attr_reader :year

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @current_speed = 0
#   end

#   def speed_up(number)
#     self.current_speed += number
#   end

#   def brake
#     self.current_speed -= 10 if self.speed > 0 
#   end

#   def shut_off
#     self.current_speed = 0
#   end

#   def spray_paint(color)
#     self.color = color
#   end

# end

# lexie = MyCar.new('2015', 'white', 'RX350')

# lexie.spray_paint('yellow')

# p lexie

# class GoodDog

#   DOG_YEARS = 7

#   attr_accessor :name, :age

#   @@number_of_dogs = 0

#   def initialize(n, a)
#     self.name = n
#     self.age = a * DOG_YEARS
#     @@number_of_dogs += 1
#   end

#   def to_s
#     "This dog is named #{self.name} and it is #{self.age} in dog years"
#   end

#   def self.total_number_of_dogs
#     @@number_of_dogs
#   end

#   def self.what_am_i 
#     "I'm a GoodDog class!"
#   end 
# end

# # puts GoodDog.total_number_of_dogs

# # dog1 = GoodDog.new
# # dog2 = GoodDog.new

# # puts GoodDog.total_number_of_dogs

# sparky = GoodDog.new("Sparky", 3)

# puts sparky

# class MyCar

#   attr_reader :color, :year

#   def self.calculate_gas_mileage(gas, mileage)
#     "The mileage per gallon is #{mileage/gas}"
#   end

#   def initialize(color, year)
#     @color = color
#     @year = year
#   end

#   def to_s
#     "My car is colored #{self.color} and built in #{self.year}"
#   end
# end

# # puts MyCar.calculate_gas_mileage(5, 234)

# lexie = MyCar.new('white', '2015')

# puts lexie

# class Animal
#   def speak
#     "Hello!"
#   end
# end

# class GoodDog < Animal
#   def speak
#     super + " from GoodDog class"
#   end
# end

# sparky = GoodDog.new
# puts sparky.speak 

# module Loadable
#   def loading(weight)
#     puts "This truck can carry up to #{weight} pounds"
#   end

# end

# class Vehicle
#   @@number_of_vehicles = 0 

#   attr_accessor :current_speed, :year, :color, :model

#   def self.calculate_gas_mileage(gallons, miles)
#     puts "#{miles/gallons} miles per gallon of gas"
#   end

#   def initialize(color, year, model)
#     @color = color
#     @year = year
#     @model = model
#     @@number_of_vehicles += 1
#     @current_speed = 0
#   end

#   def self.number_of_vehicles
#     puts "Thisp programs has created #{@@number_of_vehicles} vehicles"
#   end

#   def age
#     puts "Your #{self.model} is #{years_old} years old"
#   end

#   def speed
#     self.current_speed += 10
#     puts "This vehicle is now speeding at #{self.current_speed}"
#   end

#   private

#   def years_old
#     Time.now.year - self.year.to_i
#   end

# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4

# end

# class MyTruck <  Vehicle
#   include Loadable

#   NUMBER_OF_DOORS = 2

# end

# # MyCar.calculate_gas_mileage(1, 42)
# # MyTruck.calculate_gas_mileage(1, 15)

# vehicle1 = MyCar.new('white', '2002', 'RX350')
# vehicle2 = MyTruck.new('red', '1997', 'F-150')

# # # MyTruck.number_of_vehicles

# # vehicle2.loading(50)

# # puts MyTruck.ancestors

# vehicle1.age
# vehicle2.age

# class Student
#   attr_accessor :name, :grade

#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def show_grade
#     "#{self.name} received a grade of #{grade}"
#   end

#   def better_grade_than?(other_student_name)
# #     grade < other_student_name.grade

# #   end

# #   protected

# #   def grade
# #     @grade
# #   end

# # end

# # chris = Student.new('Chris', 'B')
# # joe = Student.new('Joe', 'A')

# # puts "Well done!" if joe.better_grade_than?(chris)

# # class Person
# #   attr_accessor :name

# #   def initialize(full_name)
# #     parts = full_name.split
# #     @first_name = parts.first
# #     @last_name = parts.size > 1 ? parts.last : ''
# #   end

# #   def name
# #     "#{first_name} #{last_name}".strip
# #   end
# # end

# # bob = Person.new('Robert')
# # puts bob.name                  # => 'Robert'
# # puts bob.first_name            # => 'Robert'
# # puts bob.last_name             # => ''
# # bob.last_name = 'Smith'
# # puts bob.name                  # => 'Robert Smith'

# # class Person
# #   attr_accessor :first_name, :last_name

# #   def initialize(full_name)
# #     parse_full_name(full_name)
# #   end

# #   def name
# #     "#{first_name} #{last_name}".strip
# #   end

# #   def name=(full_name)
# #     parse_full_name(full_name)
# #   end

# #   private

# #   def parse_full_name(full_name)
# #     parts = full_name.split
# #     self.first_name = parts.first
# #     self.last_name = parts.size > 1 ? parts.last : ''
# #   end

# #   def to_s
# #     name
# #   end

# # end

# # bob = Person.new('Robert')
# # puts bob.name                  # => 'Robert'
# # puts bob.first_name            # => 'Robert'
# # puts bob.last_name             # => ''
# # bob.last_name = 'Smith'
# # puts bob.name                  # => 'Robert Smith'

# # bob.name = "John Adams"
# # puts bob.first_name            # => 'John'
# # puts bob.last_name             # => 'Adams'

# # bob = Person.new('Robert Smith')
# # rob = Person.new('Robert Smith')

# # puts bob.name == rob.name

# # bob = Person.new("Robert Smith")
# # puts "The person's name is: #{bob}"

# # bob = Person.new("Robert Smith")
# # puts "The person's name is: #{bob}"

# class Pet

#   def run
#     'running!'
#   end

#   def jump
#     'jumping!'
#   end

# end


# class Dog < Pet

#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end

#   def fetch
#     'fetching!'
#   end
# end

# class Cat < Pet

#   def speak
#     'meow!'
#   end

# end

# class Bulldog < Dog

#   def swim
#     "can't swim"
#   end

# end


# pete = Pet.new
# kitty = Cat.new
# dave = Dog.new
# bud = Bulldog.new

# puts pete.run                # => "running!"
# # pete.speak              # => NoMethodError

# puts kitty.run               # => "running!"
# puts kitty.speak             # => "meow!"
# # kitty.fetch             # => NoMethodError

# puts dave.speak              # => "bark!"

# puts bud.run                 # => "running!"
# puts bud.swim






