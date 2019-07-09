require_relative '../config/environment'
require 'pry'

puts "WELCOME"
puts "If you accept this quest..."

# Choose a character
puts Character.all.map {|character| character.name}
puts "Enter the name of the character you'd like to use:"
chosen_character = gets.chomp
if chosen_character == "Harum the Witch"
    puts "Welcome, Harum the Witch!"
    chosen_character = Character.find(1)
elsif chosen_character == "Ashley the Wizard"
    puts "Welcome, Ashley the Wizard!"
    chosen_character = Character.find(2)
else
    puts "Choose a character."
    chosen_character = gets.chomp
end
    binding.pry

# # Enter a room
# puts "You've entered the GRAND ENTRANCE."
# puts grand_entrance.description
# puts "You see a dagger and a scroll - which will you choose?"
# puts "Enter 'dagger' or 'scroll'"
# character_item = gets.chomp
# if character_item == 'dagger'
#     character_id = dagger.character