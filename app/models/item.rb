class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    ### USE .UPDATE, & .CREATE

    # Initialize items in room with room_id <- MOVED ALL THIS TO ROOM.RB
    # def self.list_items_in_room
    #     Item.all.select { |item| item.room_id binding.pry }
    # end
    def self.get_character_item
        puts "Which one do you choose?"
        character_item = gets.chomp
        character_item = Item.find_by(name: character_item)
    end
    
    def gets_picked_up_by(character)
        self.character = character
        self.room = nil
        self.save
        puts "Great! You've selected #{name}."
    end

    def gets_dropped_by(character, room)
        self.character = nil
        self.room = room
        self.save
        puts "You've dropped your #{name}."
    end

end