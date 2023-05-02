require_relative './music'

class Startup
  def initialize
    @music_albums = []
  end

  # the user options
  def options_list
    puts ''
    puts 'Please choose an option according to the numbers on the dashboard:
    1# List all books
    2# List all music albums
    3# List of games
    4# Add a book
    5# Add a music album
    6# Add a game
    7# Exit'

    choice = gets.chomp
    selection(choice.to_i)
  end

  # We save our selection into an array
  def selection(choice)
    methods = [
      method(:booklist), method(:musiclist), method(:gamelist),
      method(:create_book), method(:add_music_album), method(:create_game), method(:quit_app)
    ]

    # according to the number entered we call the defined method
    (1..7).include?(choice) && methods[choice - 1].call
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
  def gamelist
    puts 'Game list in library'
  end

  # TODO: To be implemented later
  def create_book
    puts 'create book'
  end

  def add_music_album
    puts '_____ ADD A NEW MUSIC ALBUM _____'
    puts ''
    print 'Is it on Spotify? (y/n) '
    on_spotify_input = gets.chomp.downcase
    on_spotify = %w[y yes].include?(on_spotify_input)
    print 'What is the date of publication? (DD/MM/YYYY) '
    publish_date = gets.chomp
    print 'Is it archived? (y/n) '
    archived_input = gets.chomp.downcase
    archived = %w[y yes].include?(archived_input)
    @music_albums << MusicAlbum.new(on_spotify, publish_date, archived)
    puts 'A music album is created successfully'
  end

  # TODO: To be implemented later
  def create_game
    puts 'create game'
  end

  def quit_app
    puts 'Thanks for using our app'
    exit
  end

  # Then we start the app
  def start
    options_list
  end
end
