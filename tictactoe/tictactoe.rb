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
    @@turns = 0    
     
    def initialize(state)
      @state = state
    end

    #checks the number of turns to see if there are no more turns avaialable
    def game_over?
            if @@turns >= 9 then
                puts "No more turns available"
                return true
            end
        return false
    end
    
    #finds out which player wins after no more turns are possible 
    private 
    def find_winner
             
    end

    #checks if any player won horizontally on the board
    private
    def horizontal_check

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
    private
    def print_board

    end
end

class Player
    attr_reader :name
    attr_reader :symbol 
    @@nums = []
    
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
        else
            #COME BACK TO THIS. ERROR CHECKING NEEDED.
            puts "#{position} already in use. Pick a different number."
        end
    end   
end 

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
        if p1_turn
            puts "#{p1.name} Pick a number from 1-9 on the board"
            num_on_board = gets.chomp.to_i
            p1.place_in_board(num_on_board, p1.symbol)
            p1_turn = false 
        else
            puts "#{p2.name} Pick a number from 1-9 on the board"
            num_on_board = gets.chomp.to_i
            p2.place_in_board(num_on_board, p2.symbol)
            p1_turn = true
        end
    end
end

begin_game

