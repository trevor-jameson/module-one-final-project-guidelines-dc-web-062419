require 'pry'
# Note: "char" is a reserved word in many languages, similarly to "class"
class Character < ActiveRecord::Base
    belongs_to :user
    belongs_to :room
    has_many :items

    attr_accessor :chosen_character

    # Method ought to be renamed to something more specific (ie. #choose_character)
    def self.gets_user_input
        prompt = TTY::Prompt.new
        characters = Character.all.map {|character| character.name}
        # This should be a seperate var from the instance.
        @chosen_character = prompt.select("Choose the name of the character you'd like to use:", characters)

        # This resolves the problem of @chosen_character being a string data type before being set to an instance
        # found_character = prompt.select("Choose the name of the character you'd like to use:", characters)
        # self.set_character_to_instance(found_character)
    end

    # Could use .find_by instead of .where and you wouldn't need the first
    def self.set_character_to_instance
        # @chosen_character = Character.find_by(name: @chosen_character)
        @chosen_character = Character.where(name: @chosen_character).first
    end
    
    # This could be abstracted to accept any room (with arg of string or instance)
    def self.welcome_to_entrance
        puts "Welcome to the game, #{@chosen_character.name}!"
        @chosen_character.room_id = Room.find_by(name: "Grand Entrance").id 
        @chosen_character.save
        puts "You're now in the Grand Entrance"
    end
    # Room agnostic version. Could also take a room instance as an arg (wouldn't have to find room in that case)
    # def self.welcome_to_room(room_name)
    #     puts "Welcome to the game, #{@chosen_character.name}!"
    #     @chosen_character.room_id = Room.find_by(name: room_name).id 
    #     @chosen_character.save
    #     puts "You're now in the #{room_name}"
    # end

    # Good method. Succinct and well-named.
    def item_inventory
        self.items.map {|item| item.name}
    end

    # Good method. Has a single purpose and is well-named. Could set item_inventory to a var and reuse.
    def display_item_inventory
        if item_inventory.length == 0
            "You haven't picked up any items yet."
        else
            items_on_hand = item_inventory.join(" & ")
            "Right now, you have a " + items_on_hand
        end
    end

    # ASCII art is always a fun time!
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
            puts "It's a dragon! It looks angry. You get to use one of your items to engage with the dragon. We hope you choose wisely."
        else 
            "You haven't picked up enough items."
        end
    end

    def respond_to_dragon
        prompt = TTY::Prompt.new
        dragon_item = prompt.select("What would you like to choose?", self.item_inventory)
    end

    # You could make this decision a "choose-your-own-adventure" by calling helper method within each 
    def interact_with_dragon(item)
        if item == "Dagger"
            puts "You chose the Dagger! You and the dragon fight. The Dagger slices through the dragon's heart. You're officially a Dragon Slayer."
            # flee_from_dragon
        elsif item == "Crystal_Ball"
            puts "The Crystal Ball can't help you right now. The dragon looks at you and breathes fire. This is the end of your quest."
        elsif item == "Health_Potion"
            puts "You drink deeply from your Health Potion. You can feel your strength grow and the dragon senses it too. He bows to you and decides not to attack."
        elsif item == "Spell_Scroll"
            puts "You read from your Scroll. It's a spell to tame a dragon and you two become friends, happily ever after."
        end
    end

end