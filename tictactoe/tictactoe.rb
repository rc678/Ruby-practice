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
puts "Each player must pick a number from 1 to 9"
puts "The player who gets 3 places in a row wins the game"

#initizes the Tic-Tac-Toe board
board = {}
9.times {|n| board[n+1] = "none"}

#keeps track of the progress of the game
class GameState
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
   @@nums = []
    def intialize(name, symbol)
      @name = name
      @symbol = symbol
    end
 
    #keeps track of players position on board
    private
    def place_in_board(position)

    end   
end 




