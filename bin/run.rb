###### GENERAL NOTES ######
# Games are hard and require lots of planning upfront. Especially 'choose-your-own-adventure' style with many options
# What was your game's "win-condition"?
# Deep call stacks can break. Be wary of allowing recursive menu chains.

require_relative '../config/environment'
require 'pry'
require 'tty-prompt'
prompt = TTY::Prompt.new

### WELCOME USERS TO CLI ###
def line_break
    puts "\n"
end

def display_welcome_message
    puts "Hello, young adventurer."

    line_break

    puts "It seems you have found yourself at the beginning of a rewarding quest."
    puts "Should you accept this quest, a Magical Room shall make itself and its offerings available to you."
    puts "Out of these magical items, you will be able to equip yourself in preparation for engaging with a mythical creature."
end

display_welcome_message

line_break

### CHOOSE A CHARACTER ###
Character.gets_user_input
char = Character.set_character_to_instance

line_break

### START QUEST IN ENTRY ROOM ###
entry_room = Room.find_by(name: "Grand Entrance")
entry_room.navigate_from_the_entrance(char)

### DRAGON TIME ###
char.dragon_appears
chosen_item = char.respond_to_dragon
puts chosen_item
puts char.interact_with_dragon(chosen_item)