require_relative './game_sub_classes/game_actios'

class Startup
  # class initialization:
  # @game_actions: Object created from CameActions class
  def initialize
    @game_actions = GameActions.new
  end

  # the user options
  def options_list
    puts `Please choose an option according to the numbers on the dashboard:
    1# List all books
    2# List all music albums
    3# List of games
    4# List all genres (e.g 'Comedy', 'Thriller')
    5# List all labels (e.g. 'Gift', 'New')
    6# List all authors (e.g. 'Stephen King')
    7# Add a book
    8# Add a music album
    9# Add a game
    10# Exit`

    choice = gets.chomp
    selection(choice.to_i)
  end

  # We save our selection into an array
  def selection(choice)
    methods = [
      method(:booklist), method(:list_music_album), method(:gamelist), method(:list_genres), method(:list_labels),
      method(:list_authors), method(:create_book), method(:add_music_album), method(:create_game), method(:quit_app)
    ]

    # according to the number entered we call the defined method
    (1..10).include?(choice) && methods[choice - 1].call
  end

  # Our dashboade methods
  # Defined with default options
  # TODO: To be implemented later
  def booklist
    puts 'book list in library'
  end

  # TODO: To be implemented later
  def musiclist
    puts 'Music list in library'
  end

  # TODO: To be implemented later
  def create_book
    puts 'create book'
  end

  # TODO: To be implemented later
  def create_music
    puts 'create music'
  end

  # call create_game method from GameActions
  def create_game
    @game_actions.add_game
  end

  # list all games added
  def gamelist
    @game_actions.list_games
  end
  
  # list all authors added
  def list_authors
    @game_actions.list_authors
  end

  # Saves file befor leaving the app
  def quite_app
    @game_actions.save_games
    @game_actions.save_authors
    puts 'Thanks for using our app'
    exit
  end

  # Then we start the app
  def start
    options_list
  end
end
