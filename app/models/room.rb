require 'pry'
class Room < ActiveRecord::Base

    has_many :characters
    has_many :items

    attr_accessor :direction

    def line_break
        puts "\n"
    end

    ### ROOM NAVIGATION ###
    ## Starting from the Entrance ##
    def start_from_entrance
        prompt = TTY::Prompt.new
        @direction = prompt.select("You look around the room and you see a chest to your left, an enchantment table in front, and a bookcase to your right.", %w(Move_to_locked_chest))

        # Here're some different ways for accepting and validating user input
        # puts "Hey pick either 1, or 2. Kay?"
        # input = gets.chomp
        # while input != "1" ||  input != "2"
        #     puts "You dummy, that's not valid input!"
        #     input = gets.chomp
        # end
        # loop do
        #     if input == "1" || input == "2"
        #         break
        #     end
        # end
        line_break
    end

    def locked_chest
        prompt = TTY::Prompt.new
        @direction = prompt.select("You walk up to a chest - it's locked.", %w(Move_to_Enchantment_Table))
        line_break
    end

    # Good use of TTY and assignment
    def enchantment_table(char)
        puts "You approach the enchantment table."
        prompt = TTY::Prompt.new
        enchantment_table_item = prompt.select("There are potions lining the edge, and a glowing crystal ball. You get to pick one of these items and make it yours.", %w(Potion Crystal_Ball))
            if enchantment_table_item == 'Potion'
                puts "Great choice. This potion will help you in your quest."
                item = self.items.find_by(name: "Health_Potion")
                item.gets_picked_up_by(char)
            elsif enchantment_table_item == 'Crystal_Ball'
                puts "You see something scaly in the crystal ball as you bring it closer."
                item = self.items.find_by(name: "Crystal_Ball")
                item.gets_picked_up_by(char)
            end
        line_break
        bookcase(char)
    end

    def bookcase(char)
        prompt = TTY::Prompt.new
        bookcase_item = prompt.select("You skim the bookcase, and see a bunch of old, dust-covered scrolls. Hiding underneath the scroll, you see a dagger. You get to pick up one of these items and make it yours", %w(Spell_Scroll Dagger))
        if bookcase_item == 'Spell_Scroll'
            puts "You pick up the scroll (colorful description)"
            item = self.items.find_by(name: "Spell_Scroll")
            item.gets_picked_up_by(char)
        elsif bookcase_item == 'Dagger'
            puts "This dagger looks sharp and ready for a dragon fight."
            item = self.items.find_by(name: "Dagger")
            item.gets_picked_up_by(char)
        end
    end

    # from the entrance - RUN
    def navigate_from_the_entrance(char)
        start_from_entrance
        locked_chest
        enchantment_table(char)
    end

end