class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :items

    attr_accessor :chosen_character

    # Choose a character
    def self.puts_out_character_names
        puts "Here are a list of characters you can choose from:"
        puts Character.all.map { |character| character.name }
    end

    def self.gets_user_input
        @chosen_character = gets.chomp
    end

    def self.set_character_to_instance
        @chosen_character = Character.where(name: @chosen_character).first
    end
    
    def self.welcome_chosen_character
        puts "Welcome to the castle, #{@chosen_character.name}"
    end
    
    # # Enter a room
    # def self.update_chosen_character_room_id
    #     # binding.pry
    #     @chosen_character.room_id = Room.find(1).id
    #     @chosen_character.save
    # end
end