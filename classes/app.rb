require_relative './music'

class Startup
  attr_accessor :music_albums

  def initialize
    @music_albums = []
    @genres = []
  end

  # Title of each option when executed
  def title(title)
    puts "_____#{title.upcase}_____"
    puts ''
  end

  # the user options
  def options_list
    puts ''
    puts "Please choose an option according to the numbers on the dashboard:
    1# List all books
    2# List all music albums
    3# List of games
    4# List all genres (e.g 'Comedy', 'Thriller')
    5# List all labels (e.g. 'Gift', 'New')
    6# List all authors (e.g. 'Stephen King')
    7# Add a book
    8# Add a music album
    9# Add a game
    10# Exit"

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

  # Our dashboard methods
  # Defined with default options
  # TODO: To be implemented later
  def booklist
    puts 'book list in library'
  end

  def list_music_album
    title('list of music album')
    @music_albums.each_with_index do |music_album, index|
      puts "#{index}- Music id: #{music_album.id} - is published on #{music_album.publish_date}"
    end
  end

  # TODO: To be implemented later
  def gamelist
    puts 'Game list in library'
  end

  # List all the existing genres
  def list_genres
    title('list of genre')
    @genres.each_with_index { |genre, index| puts "#{index} - #{genre.name}" }
  end

  # TODO: To be implemented
  def list_labels
    puts 'labels'
  end

  # TODO: To be implemented
  def list_authors
    puts 'authors'
  end

  # TODO: To be implemented later
  def create_book
    puts 'create book'
  end

  def add_music_album
    title('add a music album')
    print 'Is it on Spotify? (y/n) '
    on_spotify_input = gets.chomp.downcase
    on_spotify = %w[y yes].include?(on_spotify_input)
    print 'What is the date of publication? (DD/MM/YYYY) '
    publish_date = gets.chomp
    print 'Is it archived? (y/n) '
    archived_input = gets.chomp.downcase
    archived = %w[y yes].include?(archived_input)
    print 'What is the genre of the music album? '
    genre = gets.chomp.capitalize
    new_music_album = MusicAlbum.new(on_spotify, publish_date, archived)
    # Set genre only when the user provided a genre
    unless genre.empty?
      new_genre = Genre.new(genre)
      new_music_album.add_genre(new_genre)
      @genres << new_genre
    end
    @music_albums << new_music_album
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
