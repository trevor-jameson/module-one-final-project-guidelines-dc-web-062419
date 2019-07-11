require_relative '../config/environment'
require 'pry'
require 'tty-prompt'
prompt = TTY::Prompt.new

### WELCOME USERS TO CLI ###
def line_break
    puts "\n"
end

puts "Welcome, young adventurer."
puts "If you accept this quest..."

line_break

### CHOOSE A CHARACTER ###
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

### CHARACTER DROPS ITEM
puts "Would you like to drop your item?"
answer = gets.chomp

### CHARACTER INVENTORY
puts char.item_inventory

### IS THE DRAGON COMING? 
puts char.dragon_appears?


# chosen_item = Item.selected_item
# chosen_item.character_id = char.id
# char.items << chosen_item
entry_room = Room.find_by(name: "Grand Entrance")
entry_room.navigate_from_the_entrance

# ### ROOM NAVIGATION ###
# # def navigate_from_entrance
#     puts "You look around the room and you see a chest to your left, an enchantment table in front, and a bookcase to your right."
#     puts "Which do you explore first?"
#     puts "Enter 'left', 'forward', or 'right'."
#     direction = gets.chomp
# # end

# def locked_chest
#     puts "You walk up to a chest - it's locked."
#     puts "Turn around and go left to the enchantment table, or forward to the bookcase?"
#     # puts "Enter 'left' or 'forward'."
#     direction = gets.chomp
# end

# def enchantment_table
#     puts "You approach the enchantment table (colorful description)."
#     puts "There are potions lining the edge, and a glowing crystal ball."
#     # pick up potion, crystal ball, or both?
# end

# def bookcase
#     puts "You skim the bookcase, and see a bunch of old, dust-covered scrolls."
#     # if they pick up the scroll, they see dagger underneath and have option of picking it up
#     puts "Hiding underneath the scroll you grab is a dagger."
# end

# # # if from locked_chest
# # if direction == 'left'
# #     puts "You approach the enchantment table (colorful description)."
# #     puts "There are potions lining the edge, and a glowing crystal ball."
# #     # pick up potion, crystal ball, or both?
# # end

# # from the entrance
# if direction == 'left' #(locked)
#     locked_chest
# elsif direction == 'forward'
#     enchantment_table
# elsif direction == 'right'
#     bookcase
# else
#     puts "You look around the room and you see a chest to your left, an enchantment table in front, and a bookcase to your right."
#     puts "Which do you explore first?"
#     puts "Enter 'left', 'forward', or 'right'."
# end
# # from the chest
# ## def locked_chest
# ## def unlocked_chest
# # from the enchantment table
# # from the bookcase
