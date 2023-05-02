require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :id, :archived
  def initialize (on_spotify, publish_date, archived)
    super(publish_date, archived: true)
    @on_spotify = on_spotify
  end
end