require_relative 'battleship'
require_relative 'ships'
 
 
p game = Battleship.new
game.parse_players_board
game.parse_computers_board
game.new_game
game.placing_your_ships 