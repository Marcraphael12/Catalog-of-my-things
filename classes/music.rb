require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :id, :archived

  def initialize(on_spotify, publish_date, _archived)
    super(publish_date, archived: false)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
