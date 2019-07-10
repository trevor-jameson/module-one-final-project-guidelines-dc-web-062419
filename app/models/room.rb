class Room < ActiveRecord::Base
    has_many :characters
    has_many :items

    # # # Enter a room
    # puts "You've entered the Grand Entrance."
    # chosen_character.room_id = Room.find(1).id
    # chosen_character.save

    # # enter this room - 

    # # write method to update the character's room_id
    # # chosen_character.room_id = room.id
    # dagger = Item.find(1)
    # dagger.room_id = Room.find(1).id
    # dagger.save

    # scroll = Item.find(4)
    # scroll.room_id = Room.find(1).id
    # scroll.save

end