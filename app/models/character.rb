class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :items

    attr_accessor :chosen_character

    # Choose a character
    # def self.puts_out_character_names
    #     puts "Here are a list of characters you can choose from:"
    #     puts Character.all.map { |character| character.name }
    # end

    def self.gets_user_input
        prompt = TTY::Prompt.new
        character = Character.all.map {|character| character.name}
        @chosen_character = prompt.select("Choose the name of the character you'd like to use:", character)
    end

    def self.set_character_to_instance
        @chosen_character = Character.where(name: @chosen_character).first
    end
    
    def self.welcome_to_entrance
        puts "Welcome to the game, #{@chosen_character.name}!"
        @chosen_character.room_id = Room.find_by(name: "Grand Entrance").id 
        @chosen_character.save
        puts "You're now in the Grand Entrance"
    end

    def item_inventory
        items = self.items
        if items.length == 0
            "You haven't picked up any items yet."
        else
            items_on_hand = items.map { |item| item.name }.join(" & ")
            "Right now, you have a " + items_on_hand
        end
    end

    def dragon_appears?
        item_array = self.items.map { |item| item.name }
        binding.pry
    end


end