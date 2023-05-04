require_relative '../classes/game_development'
require_relative '../classes/item'

describe Game do
  # Settings:
  # we first create a new game object
  before :each do
    @game = Game.new true, '2010-10-10', '202"-11-11'
  end

  # Test 1:
  # This is a test case that checks if the `Game` class can create a new game object correctly
  # `@game` object is an instance of the `Game` class.
  descriibe 'Create a new game object' do
    it 'Takes 3 arguments and return the game object' do
      expect(@game).to be an_instance_of Game
    end
  end

  # Test 2:
  # This is a test case that checks if the `multiplayer` attribute of the `Game` class is set
  # correctly. It expects the `multiplayer` attribute of the `@game` object to be equal to `true`.
  describe 'Multiplayer input testing' do
    it 'returns the correct value for Multiplayer' do
      expect(@game.multiplayer).to be eql true
    end
  end
end
