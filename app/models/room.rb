require 'pry'
class Room < ActiveRecord::Base

    has_many :characters
    has_many :items

    attr_accessor :direction

    ### ROOM NAVIGATION ###
    ## Starting from the Entrance ##
    def start_from_entrance
        prompt = TTY::Prompt.new
        @direction = prompt.select("You look around the room and you see a chest to your left, an enchantment table in front, and a bookcase to your right.", %w(Move_to_locked_chest))
    end

    def locked_chest
        prompt = TTY::Prompt.new
        @direction = prompt.select("You walk up to a chest - it's locked.", %w(Move_to_Enchantment_Table))
    end

    def enchantment_table(char)
        puts "You approach the enchantment table (colorful description)."
        prompt = TTY::Prompt.new
        enchantment_table_item = prompt.select("There are potions lining the edge, and a glowing crystal ball.", %w(Potion Crystal_Ball Neither))
        if enchantment_table_item == 'Potion'
            puts "You pick up a potion (colorful description)"
            item = self.items.find_by(name: "Health_Potion")
            item.gets_picked_up_by(char)
        elsif enchantment_table_item == 'Crystal_Ball'
            puts "You see something scaly in the crystal ball as you bring it closer."
            item = self.items.find_by(name: "Crystal_Ball")
            item.gets_picked_up_by(char)
        elsif enchantment_table_item == 'Neither'
            puts "After gazing at the table and the things around it for a while, you step away"
        end
        bookcase(char)
    end

    def bookcase(char)
        prompt = TTY::Prompt.new
        bookcase_item = prompt.select("You skim the bookcase, and see a bunch of old, dust-covered scrolls. Hiding underneath the scroll, you see a dagger.", %w(Spell_Scroll Dagger Neither))
        if bookcase_item == 'Spell_Scroll'
            puts "You pick up the scroll (colorful description)"
            item = self.items.find_by(name: "Spell_Scroll")
            item.gets_picked_up_by(char)
        elsif bookcase_item == 'Dagger'
            puts "This dagger looks sharp and ready for a dragon fight."
            item = self.items.find_by(name: "Dagger")
            item.gets_picked_up_by(char)
        elsif bookcase_item == 'Neither'
            puts "You notice that neither has been touched for a while by all the dust built up on the shelf."
        end
    end

    # from the entrance
    def navigate_from_the_entrance(char)
        start_from_entrance
        locked_chest
        enchantment_table(char)
    end
    
end