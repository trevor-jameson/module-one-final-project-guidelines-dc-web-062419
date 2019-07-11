class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    attr_accessor :character_item

    ### USE .UPDATE, & .CREATE

    # Initialize items in room with room_id <- MOVED ALL THIS TO ROOM.RB
    # def self.list_items_in_room
    #     Item.all.select { |item| item.room_id binding.pry }
    # end
    
    def self.get_character_item
        puts "Which one do you choose?"
        @character_item = gets.chomp
    end
    
    def self.gets_picked_up_by(character)
        name = @character_item
        item = Item.find_by(name: name)
        item.character = character
        item.save
        # puts "Great! You've selected #{name}."
    end

end