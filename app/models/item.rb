class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    attr_accessor :character_item

    ### USE .UPDATE, & .CREATE

    # Initialize items in room with room_id
    # def self.list_items_in_room
    #     Item.all.select { |item| item.room_id binding.pry }
    # end
    
    def self.get_character_item
        puts "Which one do you choose?"
        @character_item = gets.chomp
    end

    # puts "You see a dagger and a scroll - which will you choose?"
    # puts "Enter 1 for dagger or 4 for scroll"
    
    def self.selected_item
        name = @character_item
        Item.where("name = name")
        puts "Great! You've selected #{name}."
    end

    # def self.return_selection
    #     if @character_item == 1
    #         puts "You've chosen dagger"
    #     elsif @character_item == 4
    #         puts "You've chosen scroll"
    #     else
    #         puts "Enter 1 for dagger or 4 for scroll"
    #         @character_item = gets.chomp.to_i
    #     end
    # end
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