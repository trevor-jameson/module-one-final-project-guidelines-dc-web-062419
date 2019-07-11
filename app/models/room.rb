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

    def is_the_dragon_coming?
        binding.pry
        
    end

    def dragon_arrives
        puts "You've now picked up enough items. The room begins to rumble. You hear a loud roar."
        puts "You turn around and what do you see?"

        # dragon appears in the room when a character who's in the room has x number of items, probably 3?
        binding.pry
        # depending on the item they choose to engage the dragon with the character will either: 
        # lose to the dragon, defeat the dragon or befriend the dragon
    end


    
end

# room_one.items_in_entry_room
# room_one.items -> [Item:Dagger, Item:Scroll]

# room_two.items_in_entry_room
# room_two.items -> [Item:Dagger, Item:Scroll]