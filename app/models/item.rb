class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    attr_accessor :character_item

    ### USE .UPDATE, & .CREATE

    # Initialize items in room with room_id
    def self.items_in_room
        dagger = self.find(1)
        dagger.room_id = Room.find(1).id
        dagger.save

        scroll = self.find(4)
        scroll.room_id = Room.find(1).id
        scroll.save
    end
    
    def self.get_character_item
        @character_item = gets.chomp.to_i
    end

    def self.return_selection
        if @character_item == 1
            puts "You've chosen dagger"
        elsif @character_item == 4
            puts "You've chosen scroll"
        else
            puts "Enter 1 for dagger or 4 for scroll"
            @character_item = gets.chomp.to_i
        end
    end
    # depending on what the user chooses, we need to set that item's character_id to
    # the user's character
    # Item.all.each do |item|
    #     if item.id == character_item
    #         item.character_id = chosen_character.id
    #         item.save
    #     end
    # end

    # if self.id == @character_item
    #     self.character_id = @chosen_character.id

    # if character_item == 1
    #     return Item.find(1)
    #     binding.pry
    #     # puts "You've chosen dagger"
    #     # if character_item == [point to an item instance].id 
    #     # dagger.character_id = chosen_character.id
    # end
end