require 'faker'

Character.destroy_all
Room.destroy_all
Item.destroy_all

harum = Character.find_or_create_by(name: "Harum the Witch")
ashley = Character.find_or_create_by(name: "Ashley the Wizard")

entry_room = Room.find_or_create_by(name: "Grand Entrance", description: "This is a very very long description of the grand entrance.")
enchanted_room = Room.find_or_create_by(name: "Enchanted Room", description: "This is a very very long description of the enchanted room, which is lit... by magic.")
dungeon_room = Room.find_or_create_by(name: "Dungeon of Doom", description: "Woah what a scary room, omg wow.")

dagger = Item.find_or_create_by(name: "Dagger", special: false, room: entry_room)
crystal_ball = Item.find_or_create_by(name: "Crystal_Ball", special: false, room: entry_room)
potion = Item.find_or_create_by(name: "Health Potion", special: false, room: entry_room)
scroll = Item.find_or_create_by(name: "Spell_Scroll", special: true, room: entry_room)

