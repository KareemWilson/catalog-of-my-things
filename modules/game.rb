require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(published_date, multiplayer, last_played_at, archived: false)
    super(published_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && Date.parse(@last_played_at).year < Date.today.year - 2
  end

  def to_json(*_args)
    {
      'published_date' => @published_date,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }
  end
end
