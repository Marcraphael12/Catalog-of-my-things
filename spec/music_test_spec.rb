require_relative '../classes/music'
require_relative '../classes/app'

describe MusicAlbum do
  before(:context) do
    @music_album_one = MusicAlbum.new(true, '7/10/2028', false)
    @music_album_two = MusicAlbum.new(false, '21/11/2000', false)
    @music_album_three = MusicAlbum.new(true, '13/12/2010', false)
    @app = Startup.new
  end
  context 'Testing all the methods in MusicAlbum' do
    it 'Should be an instance of MusicAlbum' do
      expect(@music_album_one).to be_a MusicAlbum
      expect(@music_album_two).to be_a MusicAlbum
      expect(@music_album_three).to be_a MusicAlbum
    end

    it 'can_be_archived return false' do
      expect(@music_album_one.can_be_archived?).to eq false
      expect(@music_album_two.can_be_archived?).to eq false
    end

    it 'can_be_archived return true' do
      expect(@music_album_three.can_be_archived?).to eq true
    end

    it 'Should set archived to true' do
      expect(@music_album_three.move_to_archive).to eq true
      expect(@music_album_three.archived).to eq true
    end

    it 'Should add a music album' do
      # stub the puts method to prevent it from printing output on the console during testing
      allow(@app).to receive(:puts)
      # stub the method gets to simulate the user input
      allow(@app).to receive(:gets).and_return('y', '2/2/1999', 'n')
      expect { @app.add_music_album }.to change { @app.music_albums.size }.by(1)
    end

    it 'Should list all music albums' do
      
    end
  end
end
