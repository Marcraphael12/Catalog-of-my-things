require_relative './book'
require_relative './label'
require_relative './book_info'
require_relative './game_sub_classes/game_actions'

class Startup
  # class initialization:
  # @game_actions: Object created from CameActions class
  attr_reader :books

  def initialize
    @game_actions = GameActions.new
    @books = []
    @labels = []
  end

  # the user options
  def options_list
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
      method(:booklist), method(:list_music_album), method(:gamelist), method(:list_genres), method(:labellist),
      method(:list_authors), method(:create_book), method(:add_music_album), method(:create_game), method(:quit_app)
    ]

    # according to the number entered we call the defined method
    (1..10).include?(choice) && methods[choice - 1].call
  end

  # Our dashboade methods
  # Defined with u7default options
  # TODO: To be implemented later

  # list all the labels
  def labellist
    @labels.clear
    book_data = BookData.new
    book_data.load_label(@labels)
    puts "\nLabel list(#{@labels.length}):"
    puts '---------------'
    return puts 'No labels added yet!' if @labels.empty?

    @labels.each.with_index(1) do |label, index|
      puts "#{index}. Title: #{label.title}, Color: #{label.color}"
    end
  end

  # add book
  def create_book
    book_data = BookData.new
    puts 'Create book'
    puts '-----------------'
    puts 'Add the publisher name'
    publisher = gets.chomp
    puts 'Add the state of the cover "bad or good"'
    cover_state = gets.chomp.downcase
    puts 'The date of publishing dd/mm/yy'
    publish_date = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = add_label
    book.add_label(label)
    @books << book
    book_data.store_book(book)
    @books.clear
    @labels << label
    book_data.store_label(label)
    @labels.clear
    puts 'Book added successfully'
  end

  # list all books
  def booklist
    @books.clear
    book_data = BookData.new
    book_data.load_book(@books, @labels)
    puts 'book list in library'
    puts "\nBook list(#{@books.length}):"
    puts '--------------'
    return puts 'No books added yet!' if @books.empty?

    @books.each.with_index(1) do |book, index|
      publisher = "Publisher: #{book.publisher}, " unless book.publisher.nil?
      publish_date = "Publish date: #{book.publish_date}, " unless book.publish_date.nil?
      cover_state = "Cover state: #{book.cover_state}" unless book.cover_state.nil?
      puts "#{index}. #{publisher}#{publish_date}#{cover_state}"
    end
  end

  def add_label
    # add label
    puts 'Assign a label to the book'
    puts '-------------------------'
    puts 'Give a title to the book'
    title = gets.chomp
    puts 'Assign a color to the book'
    color = gets.chomp
    Label.new(title, color)
  end

  # To be implemented
  def list_labels
    puts 'label list'
  end

  # To be implemented
  def list_genres
    puts 'label list'
  end

  # TODO: To be implemented later
  def list_music_album
    puts 'Music list in library'
  end

  # TODO: To be implemented later
  def add_music_album
    puts 'Music list in library'
  end

  # TODO: To be implemented later

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
  def quit_app
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
