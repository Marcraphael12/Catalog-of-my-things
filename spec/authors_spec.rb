require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author1 = Author.new 'Marc', 'raphael'
    @author2 = Author.new 'Clarielle', 'larissa'
  end
end
