require_relative 'ships'
 
	class Battleship
	    attr_accessor :players_pieces, :other_players_pieces, :opponents_board, :players_board, :temporary_placement
	    LETTERS =("A".."J").to_a
 
    def initialize
       @players_board = ["____________________________________________________________________________________________________"]
       @opponents_board = ["____________________________________________________________________________________________________"]
       @players_pieces = []
       @other_players_pieces = []
       @temporary_placement = []
    end
 
    def parse_players_board
       new_board = []
       split_board = @players_board[0].gsub(/[_]/, 0.to_s).split('')
       int_board = split_board.map { |item| item.to_i}
       int_board.each_slice(10) { |i| new_board << i }
       @players_board = new_board
    end
 
    def parse_computers_board
       new_board = []
       split_board = @opponents_board[0].gsub(/[_]/, 0.to_s).split('')
       int_board = split_board.map { |item| item.to_i}
       int_board.each_slice(10) { |i| new_board << i }
       @opponents_board = new_board
    end
  
    def new_game
       reset_board
       @players_pieces = []
       @players_pieces << Ships.new(name: "Carrier",  size:  5, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Battleship",  size:  4, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Cruiser",  size:  3, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @other_players_pieces = []
       @other_players_pieces << Ships.new(name: "Carrier",  size:  5, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Battleship",  size:  4, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Cruiser",  size:  3, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
    end
  
    def placing_your_ships
       puts "Now the fun starts!!!! Placing your ships."
       puts "You have 7 ships. You can place them anywhere on the board"
       puts "But you can not place them on top of each other, or off the boards."
       puts "You can place your ships horizontal and vertical. When placing write in the format 'A1..A5' or '0A..._0E'"
       puts pretty_board(@players_board)
       puts "Place your Carrier, it has 5 spots and you have 1 of them. Where would you want to place it?"
      
       user_inputs_to_array
       until @temporary_placement.length == 5
          puts "Place your ship with 5 spots on vaild spots"
          user_inputs_to_array
       end
	       temp_place_to_board
	       @players_pieces[0].position = @temporary_placement
	       @temporary_placement = []
	       puts pretty_board(@players_board)

	       puts "Place your Battleship, it has 4 spots and you have 1 of them. Where would you want to place it?"
	       
	       user_inputs_to_array
       until @temporary_placement.length == 4
          puts "Place your ship with 4 spots on vaild spots"
          user_inputs_to_array
       end
	       temp_place_to_board
	       @players_pieces[1].position  = @temporary_placement
	       @temporary_placement = []
	       puts pretty_board(@players_board)
	 
	       puts "Place your Cruiser, it has 3 spots and you have 1 of them. Where would you want to place it?"
	       
	       user_inputs_to_array
       until @temporary_placement.length == 3
          puts "Place your ship with 3 spots on vaild spots"
          user_inputs_to_array
       end
	       temp_place_to_board
	       @players_pieces[2].position  = @temporary_placement
	       @temporary_placement = []
	       puts pretty_board(@players_board)
	 
	       puts "Place your Destroyer, it has 2 spots and you have 2 of them. Where would you want to place it?"
	       
	       user_inputs_to_array
       until @temporary_placement.length == 2
          puts "Place your ship with 2 spots on vaild spots"
          user_inputs_to_array
       end
	       temp_place_to_board
	       @players_pieces[3].position  = @temporary_placement
	       @temporary_placement = []
	       
	       puts pretty_board(@players_board)
	 
	 
	       puts "Place your Destroyer, it has 2 spots and you have 1 of them. Where would you want to place it?"
	       user_inputs_to_array
       until @temporary_placement.length == 2
          puts "Place your ship with 2 spots on vaild spots"
          user_inputs_to_array
       end
	       temp_place_to_board
	       @players_pieces[4].position  = @temporary_placement
	      @temporary_placement = []
	       
	       puts pretty_board(@players_board)
	       puts "Place your Submarine, it has 1 spots and you have 2 of them. Where would you want to place it?" 
	       user_inputs_to_array
       until @temporary_placement.length == 1
          puts "Place your ship with 1 spots on vaild spots"
          user_inputs_to_array
       end
	       p temp_place_to_board_single
	       p @temporary_placement
	       p @players_pieces[5]
	       p @players_pieces[5].position  = @temporary_placement
	       p @players_pieces[5]
	       @temporary_placement = []
	      
	       puts pretty_board(@players_board)
	       puts "Place your Submarine, it has 1 spots and you have 1 of them. Where would you want to place it?"
	       user_inputs_to_array
      until @temporary_placement.length == 1
          puts "Place your ship with 1 spots on vaild spots"
          user_inputs_to_array
       end
	       p temp_place_to_board_single
	       p @temporary_placement
	       p @players_pieces[6]
	       p @players_pieces[6].position  = @temporary_placement
	       p @players_pieces[6]
	       @temporary_placement = []
	      
	       puts pretty_board(@players_board)
	       puts "Great lets get this game on"
    end
 
 
    #private
    def pretty_board(board)
      pretty_board = <<-BOARD
 
 
        ###########################################################
        ##                                                       ##
        ##             The game of Battle Ship                   ##
        ##                                                       ##
        ###########################################################
        ###########################################################
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##           A B C D E F G H I J            Player       ##
        ##         -----------------------  [   ]   Carrier      ##
        ##       0 | X X X X X X X X X X |  [   ]   Battleship   ##
        ##       1 | X X X X X X X X X X |  [   ]   Cruiser      ##
        ##       2 | X X X X X X X X X X |  [   ]   Submarine    ##
        ##       3 | X X X X X X X X X X |  [  ,  ] Destroyer    ##
        ##       4 | X X X X X X X X X X |                       ##
        ##       5 | X X X X X X X X X X |          Computer     ##
        ##       6 | X X X X X X X X X X |  [   ]   Carrier      ##
        ##       7 | X X X X X X X X X X |  [   ]   Battleship   ##
        ##       8 | X X X X X X X X X X |  [   ]   Cruiser      ##
        ##       9 | X X X X X X X X X X |  [   ]   Submarine    ##
        ##         -----------------------  [  ,  ] Destroyer    ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ##                                                       ##
        ###########################################################
        ###########################################################
          
          BOARD
 
        board_array = board.flatten.join.to_s.chars
      	board_array.each do |cell|
         pretty_board = pretty_board.sub("X", cell)
        end
        pretty_board
    end 
 
    def convert_letters_to_nums(letter)
       if letter.class == String
          letter.upcase!
       end
       letters = ("A".."J").to_a
       letters.each_with_index do |check, index|
          if letter == check
             return index   
          end
       end
       return "Error: #{letter} is not on the board\n\n"
    end
 
 
    def board_count(board)
       miss_count = board.flatten.count("/")
       hit_count = board.flatten.count("X")
       sunk_count = board.flatten.count("S")
       total = miss_count + hit_count + sunk_count
    end
 
 
    def whoses_turns
       if board_count(@players_board) == board_count(@opponents_board)
          "Player one"
       elsif board_count(@players_board) > board_count(@opponents_board)
          "Computer"
       end 
    end
 
    def spot_type(board, row, col)
       if (row >= 10 || col >= 10)
          return "Error: [#{row},#{col}] are off the board"
       else
          if board[row][col] == 0
              0
          elsif board[row][col] == "X"
             "X"
          elsif board[row][col] == "/"
             "/"
          elsif board[row][col] == "b"
             "b"
          elsif board[row][col] == "S"
             "S"
          end  
       end
    end
 
    def reset_board
       starting_board = ["____________________________________________________________________________________________________"]
    end
 
    def who_won?
       players_count = 0 
        @players_pieces.each do |piece|
          if piece.sunken == true
             players_count += 1
          end
       end
 
       computers_count = 0 
       @other_players_pieces.each do |piece|
          if piece.sunken == true
             computers_count += 1
          end
       end
        if players_count == 7
          "You have lost all of your ships in Battleship...."
       elsif computers_count == 7
          "You have the skills to be a naval commander. Im honored to have played with you."
       else
          "Game is still going on"
       end         
    end
 
    def new_game
       reset_board
       @players_pieces = []
       @players_pieces << Ships.new(name: "Carrier",  size:  5, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Battleship",  size:  4, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Cruiser",  size:  3, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @other_players_pieces = []
       @other_players_pieces << Ships.new(name: "Carrier",  size:  5, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Battleship",  size:  4, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Cruiser",  size:  3, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Destroyer",  size:  2, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
       @other_players_pieces << Ships.new(name: "Submarine",  size:  1, quanity: 1, sunken: false)
    end
 
    def start_game
       puts "Welcome to the game of Battle ship"
       puts "Are you ready[ y / n ]?"
       answer = gets.chomp
       if answer == "y" || answer == "Y" 
          puts "Good! Because my board is already set up. Now im waiting for you fine person!"
       elsif answer == "n" || answer == "N"
          puts "Well...i don't care... LETS GO!"
       else
       sleep(1)
       end
    end
 
    def is_sunk?(boat_id)
     
    end
 
    def attack(row, col)
    end
 
    def place_X_for_suken_ships(ship)
    end
 
    def user_inputs_to_array
       answer = gets.chomp
       front = answer[0..1]
       back = answer[-2..-1]
       @temporary_placement = (front..back).to_a
    end 
 
    def temp_place_to_board
       first_letter = 0
       last_letter = 0
       counter = 0
       temp = []
       letter_check = false
       @temporary_placement.each do |places|
          if LETTERS.include?(places[0])
             letter_check = true
             last_letter =  convert_letters_to_nums(places[0])
          else
             last_letter =  places[0].to_i
          end
 
          if LETTERS.include?(places[1])
             first_letter =  convert_letters_to_nums(places[1])
          else
             first_letter =  places[1].to_i
          end
          
          if letter_check == true 
             temp << [first_letter, last_letter]
          else
             temp << [last_letter, first_letter]
          end
       end
       
       true_check =[]
       temp.each do |b,a|
          if spot_type(@players_board, b, a) == 0
              true_check << [b,a]
          else
            p  "Error, not a valid move. Try again."
          end
       end
 
       true_check.each do |b,a|
          @players_board[b][a] = "b" 
       end
    end
 
    
 
    def temp_place_to_board_single
       splitted = @temporary_placement[0].split("")
      if spot_type(@players_board, splitted[1].to_i, convert_letters_to_nums(splitted[0])) == 0
          @players_board[splitted[1].to_i][convert_letters_to_nums(splitted[0]).to_i] = "b"
       else
          p  "Error, not a valid move. Try again."
       end
    end
 
    
 
 end 