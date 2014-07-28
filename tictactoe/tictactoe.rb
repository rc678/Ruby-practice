=begin
This is a command line version
of the game Tic-Tac-Toe with
two players
=end

#rules of the Tic-Tac-Toe game
puts "1 | 2 | 3 "
puts "__|___|___"
puts "4 | 5 | 6 "
puts "__|___|___"
puts "7 | 8 | 9 "
puts "Each player must pick a number from 1 to 9 representing the above board"
puts "The player who gets 3 places in a row wins the game, including diagonals"
puts "" 

#initizes the Tic-Tac-Toe board
$board = {}
9.times {|n| $board[n+1] = "none"}


#keeps track of the progress of the game
class GameState
    attr_accessor :state
     
    def initialize(state)
      @state = state
    end

    #checks the number of turns to see if there are no more turns avaialable
    def game_over?
            if $board.has_value?("none") == false then
                puts "No more turns available"
                return true
            else
                return false
            end
    end
    
    #finds out which player wins after no more turns are possible 
    public 
    def find_winner
        puts "in find winner"
         horizontal_check    
    end

    #checks if any player won horizontally on the board
    private
    def horizontal_check
        puts "checking horizontal"
    end

    #checks if any player won vertically on the board
    private
    def vertical_check

    end

    #checks to see if a player won diagonally
    private
    def diagonal_check

    end

    #prints the current state of the board
    public
    def print_board() 
        count = 0
        9.times do |n|
            if  $board[n+1] == "none"
                print "|_|"
            elsif $board[n+1] == "X"
                print "|X|"
            else
                print "|O|"
            end
            count = count + 1
            if count == 3
                puts ""
                count = 0
            end
        end
    end
end

class Player
    attr_reader :name
    attr_reader :symbol
    
    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
 
    #keeps track of players position on board
    public
    def place_in_board(position, psymbol)
        if $board[position] == "none" then
            $board[position] = psymbol
            puts "Entered #{position} in board"
        end
    end   
end 

#function calls necessary functions and creates objects to start the game
def begin_game
    start_game = GameState.new(true)
    p1_turn = true
    puts "Enter name of Player 1. Player 1 will be X"
    player_name = gets.chomp
    p1 = Player.new(player_name, "X")
    
    puts "Enter name of Player 2. Player 2 will be O"
    player_name = gets.chomp
    p2 = Player.new(player_name, "O")

    #asks player the moves they should make
    while start_game.state
	    if start_game.game_over? == true then
            break
        end

        if p1_turn
            puts "#{p1.name}, pick a number from 1-9 on the board"
            while true
                num_on_board = gets.chomp.to_i
                if $board[num_on_board] != "none"
                    puts "This place is filled. Please pick another position." 
		        elsif (num_on_board >= 1 && num_on_board <= 9) then
                    break
                else
                    puts "You need to pick a number from 1-9. Pick again"
                end
            end
            p1.place_in_board(num_on_board, p1.symbol)
            p1_turn = false 
        else
            puts "#{p2.name}, pick a number from 1-9 on the board"
            while true
                num_on_board = gets.chomp.to_i
                if $board[num_on_board] != "none"
                    puts "This place is filled. Please pick another position."
		        elsif (num_on_board >= 1 && num_on_board <= 9) then
                    break
                else
                    puts "You need to pick a number from 1-9 on the board"
                end
            end
            p2.place_in_board(num_on_board, p2.symbol)
            p1_turn = true
        end

        start_game.print_board
    end #end of outer while

    start_game.find_winner
end

#calls the function that starts the game. 
begin_game

