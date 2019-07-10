require 'pry'
class Room < ActiveRecord::Base
    has_many :characters
    has_many :items

    def list_items
        items = self.items
        if items.length == 0
            "There are no items in this room."
        else
            items_in_room = items.map { |item| item.name }.join(" & ")
            "In this room, you'll find a " + items_in_room
        end
    end
    
end

# room_one.items_in_entry_room
# room_one.items -> [Item:Dagger, Item:Scroll]

# room_two.items_in_entry_room
# room_two.items -> [Item:Dagger, Item:Scroll]