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

  # Load_games and Load_authors methods:
  # should load the games and authors from the json file
  # and save them into array
  # then return that array containing the games/authors
  def load_games
    data = []
  end

  def load_authors
    data = []
  end

  # add_game method:
  # Takes as inputs: the publish_date, if it's multiplayer, and last_played options
  # creates a new game and push it to @games
  # creates a new author and add it to the item

  def add_game
  end
end
