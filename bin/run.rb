require_relative '../config/environment'
require 'pry'
puts "WELCOME"
puts "If you accept this quest..."
# Choose a character
puts Character.all.map {|character| character.name}
puts "Enter the name of the character you'd like to use:"
user_input = gets.chomp
if user_input == "Harum the Witch"
    puts "Welcome, Harum the Witch!"
elsif user_input == "Ashley the Wizard"
    puts "Welcome, Ashley the Wizard!"
else
    puts "Choose a character."
    user_input = gets.chomp
end