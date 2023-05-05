require_relative '../classes/music'
require_relative '../classes/app'

describe Genre do
  before(:context) do
    @music_album_one = MusicAlbum.new(true, '7/10/2028')
    @music_album_two = MusicAlbum.new(false, '21/11/2000')
    @music_album_three = MusicAlbum.new(true, '13/12/2010')
    @indie = Genre.new('indie')
    @rock = Genre.new('rock')
    @app = Startup.new
  end
  context 'Testing methods for updating genre' do
    it 'Should add genre to the music album and update the number of items to the Genre class' do
      @music_album_one.add_genre(@indie)
      expect(@music_album_one.genre).to eq @indie
      expect(@indie.items).to include @music_album_one
    end

    it 'Should add music album in Genre class and prevent to add a music album if its genre is already defined' do
      @rock.add_item(@music_album_one)
      @rock.add_item(@music_album_two)
      @rock.add_item(@music_album_three)
      expect(@rock.add_item(@music_album_one)).to eq 'The genre of the Item has already been set.'
      expect(@music_album_one.genre).to eq @indie
      expect(@music_album_two.genre).to eq @rock
      expect(@rock.items).to include @music_album_two && @music_album_three
    end

    it 'Should list all the genres' do
      @app.genres = [@indie, @rock]
      expect do
        @app.list_genres
      end.to output {
        "_____LIST OF GENRE_____\n\n0 - Indie\n1 - Rock\n"
      }.to_stdout
    end
  end
end
