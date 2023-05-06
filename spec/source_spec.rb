require 'rspec'
require_relative '../classes/source'

describe Source do
  before :each do
    @source = Source.new('spotify')
  end
  context 'When a source is created it ' do
    it 'should return @source as instance of Source' do
      expect(@source).to be_instance_of Source
    end
  end
end
