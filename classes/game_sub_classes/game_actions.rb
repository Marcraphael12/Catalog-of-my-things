require './game_development'
require './author'

class GameActions
  # Make class properties accessible
  attr_accessor :games, :authors

  # Class initialization
  # games: assigned to the method load_games(from the json file) 
  # authors: assigned to the method load_authors(from the json file)
  def initialize
    @games = load_games
    @authors = load_authors
  end
end
