require 'pry'
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
        self.items.map {|item| item.name}
    end

    def display_item_inventory
        if item_inventory.length == 0
            "You haven't picked up any items yet."
        else
            items_on_hand = item_inventory.join(" & ")
            "Right now, you have a " + items_on_hand
        end
    end

    def dragon_appears
        item_array = self.items.map { |item| item.name }
        if item_array.length >= 2
            puts "You feel the room start to shake. Puffs of smoke appear from nowhere. From behind you, you hear a rumble, the start of a roar."
            puts ",===:'.,            `-._                           
            Art by                       `:.`---.__         `-._                       
             John VanderZwaag              `:.     `--.         `.                     
                                             \.        `.         `.                   
                                     (,,(,    \.         `.   ____,-`.,                
                                  (,'     `/   \.   ,--.___`.'                         
                              ,  ,'  ,--.  `,   \.;'         `                         
                               `{D, {    \  :    \;                                    
                                 V,,'    /  /    //                                    
                                 j;;    /  ,' ,-//.    ,---.      ,                    
                                 \;'   /  ,' /  _  \  /  _  \   ,'/                    
                                       \   `'  / \  `'  / \  `.' /                     
                                        `.___,'   `.__,'   `.__,'  VZ" 
            puts "It's a dragon! It looks angry."
        else 
            "You haven't picked up enough items."
        end
    end

    def respond_to_dragon
        prompt = TTY::Prompt.new
        dragon_item = prompt.select("What would you like to choose?", self.item_inventory)
    end

    def interact_with_dragon(item)
        if item == "Dagger"
            puts "You slay the dragon"
        elsif item == "Crystal_Ball"
            puts "Sorry, ya died"
        elsif item == "Health_Potion"
            puts "???"
        elsif item == "Spell_Scroll"
            puts "You befriend the dragon"
        end
    end

end