require_relative '../classes/game_development'
require_relative '../classes/item'

describe Game do
  # Settings:
  # we first create a new game object
  before :each do
    @game = Game.new true, '2001-01-01', '2016-01-01'
  end

  # Test 1:
  # This is a test case that checks if the `Game` class can create a new game object correctly
  # `@game` object is an instance of the `Game` class.
  describe 'Create a new game object' do
    it 'Takes 3 arguments and return the game object' do
      expect(@game).to be_an_instance_of(Game)
    end
  end

  # Test 2:
  # This is a test case that checks if the `multiplayer` attribute of the `Game` class is set
  # correctly. It expects the `multiplayer` attribute of the `@game` object to be equal to `true`.
  describe 'Multiplayer input testing' do
    it 'returns the correct value for Multiplayer' do
      expect(@game.multiplayer).to eq(true)
    end
  end

  # Test 3:
  # This is a test case that checks if the `last_played_at` attribute of the `Game` class is set
  # correctly. It expects the `last_played_at` attribute of the `@game` object to be equal to
  # `'2016-01-01'`.
  describe 'Last played date check' do
    it 'returns the correct value for last played date' do
      expect(@game.last_played_at).to eq '2016-01-01'
    end
  end

  # Test 4:
  # This is a test case that checks if the `publish_date` attribute of the `Game` class is set
  # correctly. It expects the `publish_date` attribute of the `@game` object to be equal to
  # `'2001-01-01'`.
  describe 'Published date date check' do
    it 'returns the correct value for publish date' do
      expect(@game.publish_date).to eq '2001-01-01'
    end
  end

  # Test 5:
  # This is a test case that checks the functionality of the `can_be_archived?` method of the `Game`
  # class. It expects the method to return `true` when called on the `@game` object.
  describe 'Test for can_be_archived? method' do
    it 'Checks if the game can be archived or not ' do
      expect(@game.can_be_archived?).to eq(true)
    end
  end
end
