require_relative './item'

class Author < Item
  # Make class properties accessible
  attr_accessor :id, :first_name, :last_name, :items

    # Class initialization
  # Parameters:
  # first_name: string
  # last_name: string
  def initialize(first_name, last_name)
    @id = Random.rand(1..2000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author(self) unless item.author == (self)
  end
end
