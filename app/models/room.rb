class Room < ActiveRecord::Base
    has_many :characters
    has_many :items
end