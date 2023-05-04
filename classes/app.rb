require_relative './music'
require_relative './genre'
require_relative './io'

class Startup
  attr_accessor :music_albums, :genres

  def initialize
    @music_albums = []
    @genres = []
  end

  # Title of each option when executed
  def title(title)
    puts "_____#{title.upcase}_____"
    puts ''
  end

  # Check whether the genre already exists in the file
  # @param Genre[]
  # @param String
  # @return Boolean
  def exist_genre?(genres, name)
    exist = false
    genres.each do |genre|
      exist = true if genre.name == name
      break
    end
    exist
  end

  # Update number of items in a particular Genre
  # @param Genre[]
  # @param String
  # @param MusicAlbum
  # @return nil
  def update_items(genres, name, new_music_album)
    genres.each do |genre_item|
      if genre_item.name == name
        genre_item.add_item(new_music_album)
        break
      end
    end
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

  # List all the existing music albums
  def list_music_album
    @music_albums = read_file('./data/music_album.json')
    title('list of music album')
    if @music_albums.empty?
      puts 'No music album in the library'
      nil
    else
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}- Music id: #{music_album.id} - is published on #{music_album.publish_date}"
      end
    end
  end

  # TODO: To be implemented later
  def gamelist
    puts 'Game list in library'
  end

  # List all the existing genres
  def list_genres
    @genres = read_file('./data/genres.json')
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
      if exist_genre?(@genres, genre)
        # add items to that genre
        update_items(@genres, genre, new_music_album)
      else
        # create a new genre
        new_genre = Genre.new(genre)
        new_music_album.add_genre(new_genre)
        @genres << new_genre
      end
      write_file(@genres, './data/genres.json')
    end
    @music_albums << new_music_album
    write_file(@music_albums, './data/music_album.json')
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
