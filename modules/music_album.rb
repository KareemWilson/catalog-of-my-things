require_relative './item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify: false, archived: false)
    super(publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  private :can_be_archived?

  def to_json(options = {})
    {
      publish_date: @publish_date,
      on_spotify: @on_spotify,
      archived: @archived
    }.to_json(options)
  end
end
