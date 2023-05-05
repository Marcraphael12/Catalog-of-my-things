require_relative './book'
require_relative './label'
require_relative './book_info'

class Startup
  # the user options
  attr_reader :books

  def initialize
    @books = []
    @labels = []
  end

  def options_list
    puts 'Please choose an option according to the numbers on the dashboard:
    1# List all books
    2# List all labels
    3# List all music albums
    4# List of games
    5# Add a book
    6# Add a music
    7# Add a game
    8# Exit'

    choice = gets.chomp
    selection(choice.to_i)
  end

  # We save our selection into an array
  def selection(choice)
    methods = [
      method(:booklist), method(:labellist), method(:musiclist), method(:gamelist),
      method(:create_book), method(:create_music), method(:create_game), method(:quit_app)
    ]

    # according to the number entered we call the defined method
    (1..8).include?(choice) && methods[choice - 1].call
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

  # TODO: To be implemented later
  def musiclist
    puts 'Music list in library'
  end

  # TODO: To be implemented later
  def gamelist
    puts 'Game list in library'
  end

  # TODO: To be implemented later
  


  # TODO: To be implemented later
  def create_music
    puts 'create music'
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
