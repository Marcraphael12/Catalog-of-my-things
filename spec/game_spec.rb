require_relative '../classes/game_development'
require_relative '../classes/item'

# Settings:
# we first create new authors obects
before :each do
	@author1 = Author.new 'Marc', 'Raphael'
	@author2 = Author.new 'Clarielle', 'Larissa'
end
