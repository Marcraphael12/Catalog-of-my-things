require_relative '../classes/item'

describe Item do
  before :each do
    @new_item = Item.new('2023-02-03', true)
  end

  context 'when Item is created' do
    it 'should return @new_item as instance of Item' do
      expect(@new_item).to be_instance_of Item
    end

    it 'should add author' do
      author = Author.new('John', 'Doe')
      @new_item.add_author(author)
      expect(@new_item.author).to eq author
    end

    it 'should add label' do
      label = Label.new('Favorite', 'red')
      @new_item.add_label(label)
      expect(@new_item.label).to eq label
    end

    it 'should not be able to be archived' do
      expect(@new_item.can_be_archived?).to eq false
    end
  end
end
