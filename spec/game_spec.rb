require_relative '../classes/game_development'
require_relative '../classes/item'

# Settings:
# we first create a new game object
before :each do
  @game = Game.new true, '2010-10-10', '202"-11-11'
end
