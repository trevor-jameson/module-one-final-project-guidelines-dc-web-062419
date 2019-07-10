require_relative '../config/environment'
require 'pry'

### WELCOME USERS TO CLI ###
def line_break
    puts "\n"
end

puts "Welcome, young adventurer."
puts "If you accept this quest..."

line_break

### CHOOSE A CHARACTER ###
Character.puts_out_character_names

line_break

puts "Enter the name of the character you'd like to use:"
Character.gets_user_input
Character.set_character_to_instance

### ENTER GRAND ENTRANCE ###
Character.welcome_to_entrance
# Character.update_chosen_character_room_id
# Item.update_items_with_room_id

### LIST ITEMS IN GRAND ENTRANCE ### 
room = Room.find_by(name: "Grand Entrance")
puts room.list_items

puts "Which one do you choose?"
item_input = gets.chomp
# puts "You see a dagger and a scroll - which will you choose?"
# puts "Enter 1 for dagger or 4 for scroll"

# puts "You've entered the #{room}. You see #{items}."

Item.get_character_item
Item.return_selection
# character_item = gets.chomp.to_i

# # depending on what the user chooses, we need to set that item's character_id to
# # the user's character
# Item.all.each do |item|
#     if item.id == character_item
#         item.character_id = chosen_character.id
#         item.save
#     end
# end