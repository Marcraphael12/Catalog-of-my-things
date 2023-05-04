require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author1 = Author.new 'Marc', 'raphael'
    @author2 = Author.new 'Clarielle', 'larissa'
  end

  describe 'initialization of a new author' do
    it 'takes three parameters and returns 2 author objects' do
      expect(@author1).to be_an_instance_of Author
      expect(@author2).to be_an_instance_of Author
    end

    it 'returns the correct value for first name of @author1' do
      expect(@author1.firts_name).to eql 'Marc'
    end

    it 'returns the correct value for last name of @author2' do
      expect(@author2.last_name).to eql 'larissa'
    end
  end
end
