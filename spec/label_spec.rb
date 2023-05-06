require 'rspec'
require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('Love of my life', 'red')
  end

  context 'when label is created ' do
    it 'should return @label as instance of lable' do
      expect(@label).to be_instance_of Label
    end

    it 'should have title as chris' do
      expect(@label.title).to eq('Love of my life')
    end

    it 'should have color as red' do
      expect(@label.color).to eq('red')
    end
  end
end
