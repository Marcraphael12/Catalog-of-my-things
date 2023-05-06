require 'rspec'
require_relative '../classes/app'

describe Startup do
  before :each do
    @startup = Startup.new
  end
  context 'When a startup is created it ' do
    it 'should return @startup as instance of Source' do
      expect(@startup).to be_instance_of Startup
    end
    it 'should return title' do
      expect(@startup.title('book')).to eq('book')
    end
  end
end
