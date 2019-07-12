require 'pry'
class Room < ActiveRecord::Base

    has_many :characters
    has_many :items

    attr_accessor :direction

    def list_items
        items = self.items
        if items.length == 0
            "There are no items in this room."
        else
            items_in_room = items.map { |item| item.name }.join(" & ")
            "In this room, you'll find a " + items_in_room
        end
    end

    ### ROOM NAVIGATION ###
    ## Starting from the Entrance ##
    def start_from_entrance
        puts "You look around the room and you see a chest to your left, an enchantment table in front, and a bookcase to your right."
        prompt = TTY::Prompt.new
        @direction = prompt.select("Which do you explore first?", %w(Chest Table Bookcase))
        # @direction = gets.chomp
    end

    def locked_chest
        puts "You walk up to a chest - it's locked."
        # puts "Turn around and go left to the enchantment table, or forward to the bookcase?"
        # puts "Enter 'left' or 'forward'."
        prompt = TTY::Prompt.new
        @direction = prompt.select("Turn around and go left to the enchantment table, or towards the bookcase?", %w(Table Bookcase))
    end

    def enchantment_table(char)
        puts "You approach the enchantment table (colorful description)."
        prompt = TTY::Prompt.new
        enchantment_table_item = prompt.select("There are potions lining the edge, and a glowing crystal ball.", %w(Potion Crystal_Ball Both))
        # pick up potion, crystal ball, or both?
        # enchantment_table_item = gets.chomp
        if enchantment_table_item == 'Potion'
            puts "You pick up a potion (colorful description)"
            item = self.items.find_by(name: "Health Potion")
            item.gets_picked_up_by(char)
        elsif enchantment_table_item == 'Crystal_Ball'
            puts "You see something scaly in the crystal ball as you bring it closer."
            item = self.items.find_by(name: "Crystal_Ball")
            binding.pry
            item.gets_picked_up_by(char)
        elsif enchantment_table_item == 'Both'
            puts "You notice the rings of dust around the potion and crystal ball you picked up"
            # update with both
            # and save
        else
            puts "After gazing at the table and the things around it for a while, you step away"
            # break out of this function loop thing
        end
    end

    def bookcase(char)
        puts "You skim the bookcase, and see a bunch of old, dust-covered scrolls."
        prompt = TTY::Prompt.new
        # if they pick up the scroll, they see dagger underneath and have option of picking it up
        puts "Hiding underneath the scroll, you see a dagger."
        bookcase_item = gets.chomp
        if bookcase_item == 'Spell Scroll'
            puts "You pick up the scroll (colorful description)"
            item = self.items.find_by(name: "Spell Scroll")
            item.gets_picked_up_by(char)
        elsif bookcase_item == 'Dagger'
            puts "This dagger looks sharp and ready for a dragon fight."
            item = self.items.find_by(name: "Dagger")
            item.gets_picked_up_by(char)
        elsif bookcase_item == 'both'
            puts "You notice the rings of dust around the potion and crystal ball you picked up"
            # update with both
            # and save
        else
            puts "After gazing at the table and the things around it for a while, you step away"
            # break out of this function loop thing
        end
    end

    ## Starting from the Locked Chest ##
    def locked_chest_to_enchantment_table(char)
        enchantment_table(char)
    end

    def locked_chest_to_bookcase(char)
        bookcase(char)
    end

    ## Starting from the Enchantment Table ##
    def enchantment_table_to_bookcase(char)
        bookcase(char)
    end

    def enchantment_table_to_locked_chest
        locked_chest
    end

    ## Starting from the Bookcase ##
    def bookcase_to_locked_chest
        locked_chest
    end

    def bookcase_to_enchantment_table(char)
        enchantment_table(char)
    end

    # # if from locked_chest
    # if @direction == 'left'
    #     puts "You approach the enchantment table (colorful description)."
    #     puts "There are potions lining the edge, and a glowing crystal ball."
    #     # pick up potion, crystal ball, or both?
    # end

    # from the entrance
    def navigate_from_the_entrance(char)
        start_from_entrance
        if @direction == 'Chest' #(locked)
            locked_chest
            # if they select 'left'
            if @direction == 'Table'
                locked_chest_to_enchantment_table(char)
            # if they select 'forward'
            elsif @direction == 'Bookcase'
                locked_chest_to_bookcase(char)
            else
                locked_chest
            end
        elsif @direction == 'Table'
            enchantment_table(char)
            # if they select bookcase

            # if they select locked_chest
        elsif @direction == 'Bookcase'
            bookcase(char)
            # if they select locked_chest

            # if they select enchantment table
        else
            start_from_entrance
        end
    end
    # from the chest
    ## def locked_chest
    ## def unlocked_chest
    # from the enchantment table
    # from the bookcase
    
end

# room_one.items_in_entry_room
# room_one.items -> [Item:Dagger, Item:Scroll]

# room_two.items_in_entry_room
# room_two.items -> [Item:Dagger, Item:Scroll]