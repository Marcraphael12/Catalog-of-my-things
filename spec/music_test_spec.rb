require_relative '../classes/music'
require_relative '../classes/genre'

describe MusicAlbum do
  before(:context) do
    @music_album_one = MusicAlbum.new(true, '7/10/2028', false)
    @music_album_two = MusicAlbum.new(false, '21/11/2000', false)
    @music_album_three = MusicAlbum.new(true,'13/12/2010', false)
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

    it 'Set archived to true' do
      expect(@music_album_three.move_to_archive).to eq true
      expect(@music_album_three.archived).to eq true
    end
    
    it 'Should add genre to the music album and update the number of items to the Genre class' do
      indie = Genre.new('indie')
      @music_album_one.add_genre(indie)
      expect(@music_album_one.genre).to eq indie
      expect(indie.items).to include @music_album_one
    end

    it 'Should add music album in Genre class and prevent to add a music album if its genre is already defined' do
      rock = Genre.new('rock')
      indie = Genre.new('indie')
      @music_album_one.add_genre(indie)
      rock.add_item(@music_album_one)
      rock.add_item(@music_album_two)
      rock.add_item(@music_album_three)
      expect(@music_album_one.genre).to eq indie
      expect(@music_album_two.genre).to eq rock
      expect(rock.items).to include @music_album_two && @music_album_three
    end
  end  
end