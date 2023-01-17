require 'date'

class Item
  attr_accessor :published_date, :archived

  def initialize(published_date, archived)
    @published_date = published_date
    @archived = archived
    @id = Random.rand(1..1000)
  end

  def can_be_archived?
    Date.parse(@published_date).year < Date.today.year - 10
  end

  private :can_be_archived?

  def move_to_archive?
    return unless can_be_archived?

    true
  end
end