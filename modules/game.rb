require_relative "item.rb"

class Game < Item
    attr_accessor :multiplayer, :last_played_at

    def initialize(published_date, archived, multiplayer, last_played_at)
        super(published_date, archived)
        @multiplayer = multiplayer
        @last_played_at  = last_played_at
    end

    def can_be_archived?
        if super && Date.parse(@last_played_at).year < Date.today().year - 2
            true
        else 
            false
        end
    end
end