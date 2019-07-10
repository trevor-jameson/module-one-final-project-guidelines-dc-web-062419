require_relative '../config/environment'
require 'pry'

puts "Welcome, young adventurer."
puts "If accept this quest..."
# Choose a character
puts Character.puts_out_character_names
puts Character.gets_user_input


# puts "Enter the name of the character you'd like to use:"
# chosen_character = gets.chomp

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

# # Enter a room
puts "You've entered the Grand Entrance."
chosen_character.room_id = Room.find(1).id
chosen_character.save

# enter this room - 

# write method to update the character's room_id
# chosen_character.room_id = room.id
dagger = Item.find(1)
dagger.room_id = Room.find(1).id
dagger.save

scroll = Item.find(4)
scroll.room_id = Room.find(1).id
scroll.save

puts "You see a dagger and a scroll - which will you choose?"

# write method to update the items' room_ids

item_id = Item.all.collect { |item| item.id }

puts "Enter 1 for dagger or 4 for scroll"

character_item = gets.chomp.to_i

# depending on what the user chooses, we need to set that item's character_id to
# the user's character
Item.all.each do |item|
    if item.id == character_item
        item.character_id = chosen_character.id
        item.save
    end
end

binding.pry

# if character_item == 1
#     return Item.find(1)
#     binding.pry
#     # puts "You've chosen dagger"
#     # if character_item == [point to an item instance].id 
#     # dagger.character_id = chosen_character.id
# end