require_relative './item'
class Game < Item
  # Makes our class properties accessible
  attr_accessor :multiplayer, :last_played_at

  # Class initialization
  # Parameters:
  # multiplayer: boolean
  # last_played_at: date
  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
