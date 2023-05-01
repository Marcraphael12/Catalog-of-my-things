require_relative "./genre"
require_relative "./source"
require_relative "./author"
require_relative "./label"

class Item
  attr_reader :id, :genre, :source, :author, :label
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = Genre.new(name)
  end

  def add_source(source)
    @source = Source.new(name)
  end

  def add_author(author)
    @author = Author.new(first_name, last_name)
  end

  def add_label(label)
    @label = Label.new(title, color)
  end
end
