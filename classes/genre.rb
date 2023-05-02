class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..2000)
    @name = name
    @items = []
  end

  def add_item(item)
    if item.genre&.name
      'The genre of the Item has already been set.'
    else
      @items << item
      item.add_genre(self) unless item.genre == (self)
    end
  end
end
