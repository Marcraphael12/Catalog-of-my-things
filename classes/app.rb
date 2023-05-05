require_relative './music'
require_relative './genre'
require_relative '../modules/io'
require_relative '../modules/music_album_helper'

class Startup
  include MusicAlbumHelper
  include IOHelper

  attr_accessor :music_albums, :genres

  def initialize
    @music_albums = read_file('./data/music_album.json', 'MusicAlbum')
    @genres = read_file('./data/genres.json', 'Genre')
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

  # List all the existing music albums
  def list_music_album
    @music_albums = read_file('./data/music_album.json', 'MusicAlbum')
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
    @genres = read_file('./data/genres.json', 'Genre')
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
    # Handle user input
    on_spotify = ask_on_spotify
    publish_date = ask_publish_date
    archived = ask_archived
    genre = ask_genre
    # Create a new music album
    new_music_album = MusicAlbum.new(on_spotify, publish_date, archived: archived)
    # Set genre only when the user provided a genre
    add_genre_to_music_album(@genres, new_music_album, genre) unless genre.empty?
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
