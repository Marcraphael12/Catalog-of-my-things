class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

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
