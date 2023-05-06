require_relative '../classes/music'
require_relative '../classes/app'

describe MusicAlbum do
  before(:context) do
    @music_album_one = MusicAlbum.new(true, '2028-7-10')
    @music_album_two = MusicAlbum.new(false, '2000-11-11')
    @music_album_three = MusicAlbum.new(true, '2010-12-13')
    @app = Startup.new
  end
  context 'Testing all the methods in MusicAlbum' do
    it 'Should be an instance of MusicAlbum' do
      expect(@music_album_one).to be_an_instance_of MusicAlbum
      expect(@music_album_two).to be_an_instance_of MusicAlbum
      expect(@music_album_three).to be_an_instance_of MusicAlbum
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
      allow(@app).to receive(:gets).and_return('y', '2/2/1999', 'n', 'pop')
      expect { @app.add_music_album }.to change { @app.music_albums.size }.by(1)
    end

    it 'Should list all music albums' do
      @app.music_albums = [@music_album_one]
      expect do
        @app.list_music_album
      end.to output {
        "_____LIST OF MUSIC ALBUM_____\n\n0- Music id: #{@music_album_one.id} - is published on 2028-10-07\n"
      }.to_stdout
    end

    # Test to_json
    it 'Should return a json object' do
      expected_json = @music_album_one.to_json
      parsed_output = JSON.parse(expected_json)

      expect(parsed_output['id']).to eq(@music_album_one.instance_variable_get(:@id))
      expect(parsed_output['publish_date']).to eq('2028-7-10')
      expect(parsed_output['archived']).to eq(false)
      expect(parsed_output['genre_id']).to eq nil
    end

    # Test from_json
    it 'Should return an object from json' do
      expected_json = @music_album_one.to_json
      parsed_output = JSON.parse(expected_json)
      obj = MusicAlbum.from_json(expected_json)

      expect(obj.instance_variable_get(:@publish_date)).to eq(parsed_output['publish_date'])
      expect(obj.instance_variable_get(:@archived)).to eq(parsed_output['archived'])
      expect(obj.instance_variable_get(:@genre)).to eq(nil)
    end
  end
end
