class Item < ActiveRecord::Base
    belongs_to :character
    belongs_to :room

    puts "You see a dagger and a scroll - which will you choose?"

    # write method to update the items' room_ids

    item_id = Item.all.collect { |item| item.id }

    puts "Enter 1 for dagger or 4 for scroll"

    character_item = gets.chomp.to_i

    # depending on what the user chooses, we need to set that item's character_id to
    # the user's character
    Item.all.each do |item|
        if item.id == character_item
            item.character_id = chosen_character.id
            item.save
        end
    end

    binding.pry

    # if character_item == 1
    #     return Item.find(1)
    #     binding.pry
    #     # puts "You've chosen dagger"
    #     # if character_item == [point to an item instance].id 
    #     # dagger.character_id = chosen_character.id
    # end
end