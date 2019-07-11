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
char = Character.set_character_to_instance

line_break

### ENTER GRAND ENTRANCE ###
Character.welcome_to_entrance
# Character.update_chosen_character_room_id
# Item.update_items_with_room_id

### LIST ITEMS IN GRAND ENTRANCE ### 
room = Room.find_by(name: "Grand Entrance")
puts room.list_items

line_break

### CHARACTER PICKS UP ITEM
item = Item.get_character_item
item.gets_picked_up_by(char)

### CHARACTER INVENTORY
puts char.item_inventory

### IS THE DRAGON COMING? 


# chosen_item = Item.selected_item
# chosen_item.character_id = char.id
# char.items << chosen_item