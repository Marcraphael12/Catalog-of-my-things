require_relative '../classes/music'

describe Genre do
  before(:context) do
    @music_album_one = MusicAlbum.new(true, '7/10/2028', false)
    @music_album_two = MusicAlbum.new(false, '21/11/2000', false)
    @music_album_three = MusicAlbum.new(true, '13/12/2010', false)
    @indie = Genre.new('indie')
    @rock = Genre.new('rock')
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
  end
end