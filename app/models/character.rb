class Character
    def initialize
        @alignment = alignment
        @language = language
    end
end

# wizard, rogue, druid?
class Wizard < Character
    def initialize
        @proficiences = ["Daggers, darts, slings, quarterstaffs, light crossbows"]
    end

    # if wizard picks up an item that 
end

class Rogue < Character
    def initialize
        @proficiences = ["Simple weapons, hand crossbows, longswords, rapiers, shortswords"]
    end

    # if wizard picks up an item that 
end

class Druid < Character
    def initialize
        @proficiences = ["Clubs, daggers, darts, javelins, maces, quarterstaffs, scimitars, sickles, slings, spears"]
    end

    # if wizard picks up an item that 
end

# can weapons be randomly generated, and if they pick up a weapon that they're proficient in, they fight/do well against an enemy?