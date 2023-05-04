require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author1 = Author.new 'Marc', 'raphael'
    @author2 = Author.new 'Clarielle', 'larissa'
    @new_item = Item.new '2023-05-04'
  end

  describe 'initialization of a new author' do
    it 'takes three parameters and returns 2 author objects' do
      expect(@author1).to be_an_instance_of Author
      expect(@author2).to be_an_instance_of Author
    end

    it 'returns the correct value for first name of @author1' do
      expect(@author1.first_name).to eql 'Marc'
    end

    it 'returns the correct value for last name of @author2' do
      expect(@author2.last_name).to eql 'larissa'
    end
  end

  describe 'add_item method test' do
    it 'should add new author item' do
      @author1.add_item(@new_item)
      expect(@author1.items).to eql([@new_item])
    end
  end
end
