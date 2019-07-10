class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :items

    # Choose a character
    puts Character.all.map { |character| character.name }
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

end