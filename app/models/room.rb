require 'pry'
class Room < ActiveRecord::Base
    has_many :characters
    has_many :items

    def list_items_in_room
        Item.all.select do |item|
            item.room == self
            binding.pry
        end
    end
end

# room_one.items_in_entry_room
# room_one.items -> [Item:Dagger, Item:Scroll]

# room_two.items_in_entry_room
# room_two.items -> [Item:Dagger, Item:Scroll]