require_relative '../classes/book'
require 'json'

class Book_Data
  def store_book(books)
     books_json = {
      id: books.id,
      publish_date: books.publish_date,
      publisher: books.publisher,
      cover_state: books.cover_state,
      label_id: books.label.id
      }
     file_path = './book_data/books.json'
      if File.size?(file_path)
       books = JSON.parse(File.read(file_path))
       books << books_json
       File.write(file_path, JSON.pretty_generate(books))
      else
        File.write(file_path, JSON.pretty_generate([books_json]))
      end
    end

  def load_book(book_arr, label_arr)
    file_path = './book_data/books.json'
    if File.exist?(file_path) && !File.empty?(file_path)
      books = JSON.parse(File.read(file_path))
      books.each do |book|
        new_book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
        book_arr << new_book
      end
    end
  end 

    def store_label(labels)
      label_json = {
        id: labels.id,
        title: labels.title,
        color: labels.color,
        items: labels.items.map(&:id)
      }
      file_path = './book_data/labels.json'
      if File.exist?(file_path) && !File.empty?(file_path)
        labels = JSON.parse(File.read(file_path))
        labels << label_json
        File.write(file_path, JSON.pretty_generate(labels))
      else
        File.write(file_path, JSON.pretty_generate([label_json]))
      end
    end

    def load_label(label_arr)
      file_path = './book_data/labels.json'
      if File.size?(file_path)
        labels = JSON.parse(File.read(file_path))
        labels.each do |label|
          new_label = Label.new(label['title'], label['color'])
          label_arr << new_label
        end
      end
    end
end
