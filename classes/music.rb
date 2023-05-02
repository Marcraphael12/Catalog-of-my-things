require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :id, :archived

  def initialize(on_spotify, publish_date, _archived)
    super(publish_date, archived: true)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    Date.today.prev_year(10) > @publish_date && _on_spotify
  end
end
