require_relative './genre'
require_relative './source'
require_relative './author'
require_relative './label'
require 'date'

class Item
  attr_accessor :publish_date, :archived, :id, :genre, :source, :author, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    Date.today.prev_year(10) > @publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
