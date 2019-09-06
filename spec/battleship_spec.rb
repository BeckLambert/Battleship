require_relative '../battleship'
 
	describe 'Battleship' do
	 	let (:game1) {Battleship.new}
	 	describe '#initialize' do
	 		it 'it initializes a new opponents board' do
	 			expect(game1.players_pieces).to eq []
	 		end
 
 		it 'it initializes new players pieces board' do
 			expect(game1.other_players_pieces).to eq []
 		end
 
 		it 'it initializes new other players pieces board' do
 			expect(game1.opponents_board).to eq ["____________________________________________________________________________________________________"]
 		end
 
 		it 'it initializes new other players pieces board' do
			expect(game1.players_board).to eq ["____________________________________________________________________________________________________"]
 		end
 
 		it 'it initializes new other players pieces board' do
 			expect(game1.temporary_placement).to eq []
 		end
 	end
 
 	describe '#parse_board' do
 		it 'it should parse the currents player board' do
 			expect(game1.parse_players_board).to eq [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
 
 		end
 	
 		it 'it should parse the other player board' do
			expect(game1.parse_computers_board).to eq [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
 
 		end
 
 		it 'the player board should now be parsed and returned to the player' do
 			game1.parse_players_board
 			expect(game1.players_board).to eq [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
 		end
 
 		it 'the computers board should now be parsed and returned to the computer' do
 			game1.parse_computers_board
 			expect(game1.opponents_board).to eq [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
 		end
 	end
 
 	# describe '#pretty_board' do 
 	# 		DISPLAY = <<-BOARD
 

 	# 		###########################################################
 	# 		##                                                       ##
 	# 		##             The game of Battle Ship                   ##
 	# 		##                                                       ##
 	# 		###########################################################
 	# 		###########################################################
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##           A B C D E F G H I J            Player       ##
 	# 		##         -----------------------  [   ]   Carrier      ##
 	# 		##       0 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Battleship   ##
 	# 		##       1 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Cruiser      ##
 	# 		##       2 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Submarine    ##
 	# 		##       3 | 0 0 0 0 0 0 0 0 0 0 |  [  ,  ] Destroyer    ##
    # 		##       4 | 0 0 0 0 0 0 0 0 0 0 |                       ##
 	# 		##       5 | 0 0 0 0 0 0 0 0 0 0 |          Computer     ##
 	# 		##       6 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Carrier      ##
 	# 		##       7 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Battleship   ##
 	# 		##       8 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Cruiser      ##
 	# 		##       9 | 0 0 0 0 0 0 0 0 0 0 |  [   ]   Submarine    ##
 	# 		##         -----------------------  [  ,  ] Destroyer    ##
	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		##                                                       ##
 	# 		###########################################################
 	# 		###########################################################
 
 	# 		BOARD
  	
 
 	# 	it 'it will display the current players board on the pretty board' do
 	# 		game1.parse_players_board
 	# 		expect(DISPLAY).to eq (game1.pretty_board(game1.players_board))
 	# 	end
 		# it 'it will display the current computers board on the pretty board' do
 		# 	game1.parse_board(game1.opponents_board)
 		# 	expect(game1.pretty_board(game1.opponents_board)).to include( :display.to_s)
 		# end
 	# end
 
 	describe '#convert_letters_to_nums' do 
 		it 'it will return a number when given the letter "B"' do
 			expect(game1.convert_letters_to_nums("B")).to eq 1
 		end
 		it 'it will return a number when given the letter "F"' do
 			expect(game1.convert_letters_to_nums("F")).to eq 5
 		end  
 		it 'it will return an Error when a number is not on the board' do
 			expect(game1.convert_letters_to_nums("Z")).to include("Error")
 		end
 	end
 
 	describe '#whoses_turns' do
 		it 'it should return player 1 if the game is just starting' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "X"
 
 			game1.parse_computers_board
 			game1.opponents_board[1][2] = "X"
    		expect(game1.whoses_turns).to eq "Player one"
 		end
 
 		it 'it should return player 1 if the game is just starting' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "X"
 
 			expect(game1.whoses_turns).to eq "Computer"
 		end
 	end
 
 	describe '#spot_type' do 
 		it 'it will return 0 if the the spot returns as open' do
 			game1.parse_players_board
 			expect(game1.spot_type(game1.players_board, 1, 2)).to eq 0
 		end
 		
 		it 'it will return X if the the spot returns as a Hit' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "X"
 			expect(game1.spot_type(game1.players_board, 1, 2)).to eq "X" 
 		end
 
 		it 'it will return / if the the spot returns as a Miss' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "/"
 			expect(game1.spot_type(game1.players_board, 1, 2)).to eq "/" 
 		end
 
 		it 'it will return b if the the spot returns as a boat' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "b"
 			expect(game1.spot_type(game1.players_board, 1, 2)).to eq "b" 
 		end
 
 		it 'it will return S if the the spot returns as a Sunk' do
 			game1.parse_players_board
 			game1.players_board[1][2] = "S"
 			expect(game1.spot_type(game1.players_board, 1, 2)).to eq "S" 
 		end
 	end
 
 	describe '#reset_board' do 
 		it 'it should return a array with a string in side of it ' do
 			expect(game1.reset_board).to eq ["____________________________________________________________________________________________________"]
 		end
 	end
 
 	describe '#who_won?' do 
 		it 'it should return "Player won"' do
 			game1.new_game
 			game1.parse_players_board
 			game1.parse_computers_board
 			7.times.map {|i| game1.other_players_pieces[i].sunken = true }
 			expect(game1.who_won?).to eq "You have the skills to be a naval commander. Im honored to have played with you."
		end
 
 		it 'it should return "the computer won"' do
 			game1.new_game
 			game1.parse_players_board
 			game1.parse_computers_board
 			7.times.map {|i| game1.players_pieces[i].sunken = true }
 			expect(game1.who_won?).to eq "You have lost all of your ships in Battleship...."
 		end
 
 		it 'it should return "Game in progress"' do
 			game1.new_game
 			game1.parse_players_board
 			game1.parse_computers_board
 			2.times.map {|i| game1.other_players_pieces[i].sunken = true }
 			4.times.map {|i| game1.players_pieces[i].sunken = true }
 			expect(game1.who_won?).to eq "Game is still going on"
 		end
 	end
 end
 
