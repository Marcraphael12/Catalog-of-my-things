require_relative '../classes/game_sub_classes/game_actions'

describe GameActions do
  before :each do
    @gameactions = GameActions.new
    @game1 = Game.new(true, ' 2023-02-02', '2024-01-01')
    @game2 = Game.new(false, ' 2023-01-01', '2024-03-06')
    @games = [@game1, @game2]
  end

  context 'when gameActions is created' do
    it 'should return instance of gameactions' do
      expect(@gameactions).to be_instance_of GameActions
    end

    it 'should return the data in array' do
      @gameactions.load_games
      expect(@gameactions.games[0].id).to eq 308
    end

    it 'should return the data in author' do
      @gameactions.load_authors
      expect(@gameactions.authors[0].id).to eq 1795
    end
  end
end
