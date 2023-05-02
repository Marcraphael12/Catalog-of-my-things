require_relative './genre'
require_relative './source'
require_relative './author'
require_relative './label'
require 'date'

class Item
  attr_reader :id, :genre, :source, :author, :label
  attr_accessor :publish_date, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre(_genre)
    @genre = _genre
    _genre.items << self unless _genre.items.include?(self)
  end

  def add_source(_source)
    @source = _source
    _source.items << self unless _source.items.include?(self)
  end

  def add_author(_author)
    @author = _author
    _author.items << self unless _author.items.include?(self)
  end

  def add_label(_label)
    @label = _label
    _label.items << self unless _label.items.include?(self)
  end

  def can_be_archived?
    Date.today.prev_year(10) > @publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
