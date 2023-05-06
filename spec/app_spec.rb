require 'rspec'
require_relative '../classes/app'
require_relative '../classes/music'

describe Startup do
  before :each do
    @startup = Startup.new
    @music_album_one = MusicAlbum.new(true, '2028-7-10')
  end
  context 'When a startup is created it ' do
    it 'should return @startup as instance of Source' do
      expect(@startup).to be_instance_of Startup
    end
    it 'should return title' do
      expect(@startup.title('book')).to eq('book')
    end
    it 'Should add a music album' do
      # stub the puts method to prevent it from printing output on the console during testing
      allow(@startup).to receive(:puts)
      # stub the method gets to simulate the user input
      allow(@startup).to receive(:gets).and_return('y', '2/2/1999', 'n', 'pop')
      expect { @startup.add_music_album }.to change { @startup.music_albums.size }.by(1)
    end

    it 'Should list all music albums' do
      @startup.music_albums = [@music_album_one]
      expect do
        @startup.list_music_album
      end.to output {
        "_____LIST OF MUSIC ALBUM_____\n\n0- Music id: #{@music_album_one.id} - is published on 2028-10-07\n"
      }.to_stdout
    end
  end
end
