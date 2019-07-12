class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    ### USE .UPDATE, & .CREATE

    def self.get_character_item
        puts "Which one do you choose?"
        character_item = gets.chomp
        character_item = Item.find_by(name: character_item)
    end
    
    def gets_picked_up_by(character)
        self.character = character
        self.room = nil
        self.save
    end

    def gets_dropped_by(character, room)
        self.character = nil
        self.room = room
        self.save
    end

end