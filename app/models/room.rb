require 'pry'
class Room < ActiveRecord::Base
    has_many :characters
    has_many :items

    attr_accessor :chosen_character

    # # Enter a room
    def self.update_chosen_character_room_id
        binding.pry
        @chosen_character.room_id = Room.find(1).id
        @chosen_character.save
    end

    # Initialize items in room with room_id
    def self.update_items_with_room_id
        dagger = Item.find(1)
        dagger.room_id = Room.find(1).id
        dagger.save

        scroll = Item.find(4)
        scroll.room_id = Room.find(1).id
        scroll.save
    end
end