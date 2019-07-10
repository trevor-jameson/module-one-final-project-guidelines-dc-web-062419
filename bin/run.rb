require_relative '../config/environment'
require 'pry'

### WELCOME USERS TO CLI ###
line_break = " "
puts "Welcome, young adventurer."
puts "If you accept this quest..."

puts line_break

### CHOOSE A CHARACTER ###
Character.puts_out_character_names

puts line_break

puts "Enter the name of the character you'd like to use:"
Character.gets_user_input
Character.welcome_chosen_character

### ENTER A ROOM ###
puts "You've entered the Grand Entrance."
Room.update_chosen_character_room_id
Room.update_items_with_room_id

puts "You see a dagger and a scroll - which will you choose?"

# # write method to update the items' room_ids

# item_id = Item.all.collect { |item| item.id }

# puts "Enter 1 for dagger or 4 for scroll"

# character_item = gets.chomp.to_i

# # depending on what the user chooses, we need to set that item's character_id to
# # the user's character
# Item.all.each do |item|
#     if item.id == character_item
#         item.character_id = chosen_character.id
#         item.save
#     end
# end