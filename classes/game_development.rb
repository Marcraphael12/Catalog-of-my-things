require_relative './item'
class Game < Item
  # Makes our class properties accessible
  attr_accessor :multiplayer, :last_played_at

  # Class initialization
  # Parameters:
  # multiplayer: boolean
  # last_played_at: date
  def initialize(multiplayer, last_played_at, publish_date)
    # Calls the parent class constructor
    super publish_date
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  # We check if the game can be archive or not
  def can_be_archived?
    super && (@last_played.year < Date.today.year - 2)
  end
end
