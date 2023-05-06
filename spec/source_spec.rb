require 'rspec'
require_relative '../classes/source'

describe Source do
  before :each do
    @source = Source.new('spotify')
    @game1 = Game.new(true, ' 2023-02-02', '2024-01-01')
  end
  context 'When a source is created it ' do
    it 'should return @source as instance of Source' do
      expect(@source).to be_instance_of Source
    end
    it 'Should add item' do
      @source.add_item(@game1)
      expect(@source.items).to include @game1
    end
  end
end
