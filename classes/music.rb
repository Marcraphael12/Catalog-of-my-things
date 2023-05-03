require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :id, :archived

  def initialize(on_spotify, publish_date, _archived)
    super(publish_date, archived: false)
    @on_spotify = on_spotify
  end

  # @override
  # @return true if parent's method returns true AND if on_spotify equals true
  def can_be_archived?
    super && @on_spotify
  end

  # @override
  # serialization : object to json
  # call the original to_json method
  # parse the json representation into Ruby hash
  # merge the hash with the new attributes
  # convert the hash back to json
  def to_json(*args)
    super_attrs = JSON.parse(super(*args))
    merged_attrs = super_attrs.merge({ on_spotify: @on_spotify })
    JSON.generate(merged_attrs)
  end

  # @override
  # deserialization : json to object
  def self.from_json(string)
    data = JSON.parse(string)
    new(data['on_spotify'], data['publish_date'], data['archived'])
  end
end
