require_relative './item'

class Author < Item
  # Make class properties accessible
  attr_accessor :id, :first_name, :last_name, :items

  # Class initialization
  # Parameters:
  # first_name: string
  # last_name: string
  def initialize(first_name, last_name)
    # call the parent calss constructor
    super
    @id = Random.rand(1..2000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  # Add_item method:
  # should take an instance of the Item class as an input.
  # should add the input item to the collection of items.
  def add_item(item)
    @items << item
    item.author == (self)
  end
end
