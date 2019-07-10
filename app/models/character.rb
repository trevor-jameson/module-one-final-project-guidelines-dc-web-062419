class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :items

    attr_accessor :chosen_character

    # Choose a character
    def self.puts_out_character_names
        puts "Here are a list of characters you can choose from:"
        puts Character.all.map { |character| character.name }
        # chosen_character = gets.chomp
    end

    def self.gets_user_input
        @chosen_character = gets.chomp
    end

    def self.welcome_chosen_character
        if @chosen_character == "Harum the Witch"
            puts "Welcome, Harum the Witch!"
            @chosen_character = Character.find(1)
        elsif @chosen_character == "Ashley the Wizard"
            puts "Welcome, Ashley the Wizard!"
            @chosen_character = Character.find(2)
        else
            puts "Choose a character."
            @chosen_character = gets.chomp
        end
    end
end