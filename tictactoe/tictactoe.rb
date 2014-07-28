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
        x_nums = $board.select {|key| $board[key] == "X" }
        o_nums = $board.select { |key| $board[key] == "O" }       
        winner =  horizontal_check(x_nums, o_nums)
        if winner == "p1" || winner == "p2" then
            return winner
        end
        winner = vertical_check(x_nums, o_nums)
        if winner == "p1" || winner == "p2" then
            return winner
        end
        winner = diagonal_check(x_nums, o_nums)
        if winner == "p1" || winner == "p2" then
            return winner
        end
        return "Nobody"
    end

    #checks if any player won horizontally on the board
    private
    def horizontal_check(x, o)
        case1 = [1,2,3].all? {|num| x.key?(num) } 
        case2 = [4,5,6].all? {|num| x.key?(num) } 
        case3 = [7,8,9].all? {|num| x.key?(num) }
        case4 = [1,2,3].all? {|num| o.key?(num) }
        case5 = [4,5,6].all? {|num| o.key?(num) }
        case6 = [7,8,9].all? {|num| o.key?(num) }
        
        if case1 || case2 || case3
            return "p1"
        elsif case4 || case5 || case6
            return "p2"
        else
            return "not p1 or p2"
        end 
    end

    #checks if any player won vertically on the board
    private
    def vertical_check(x, o)
        case1 = [1,4,7].all? {|num| x.key?(num)}
        case2 = [2,5,8].all? {|num| x.key?(num)}
        case3 = [3,6,9].all? {|num| x.key?(num)}
        case4 = [1,4,7].all? {|num| o.key?(num)}
        case5 = [2,5,8].all? {|num| o.key?(num)}
        case6 = [3,6,9].all? {|num| o.key?(num)}

        if case1 || case2 || case3
            return "p1"
        elsif case4 || case5 || case6
            return "p2"
        else
            return "not p1 or p2"
        end
    end

    #checks to see if a player won diagonally
    private
    def diagonal_check(x, o)
        case1 = [1,5,9].all? {|num| x.key?(num)}
        case2 = [3,5,7].all? {|num| x.key?(num)}
        case3 = [1,5,9].all? {|num| o.key?(num)}
        case4 = [3,5,7].all? {|num| o.key?(num)}
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
        else
            player_who_won = start_game.find_winner
            if player_who_won == "p1" || player_who_won == "p2"
                break
            end
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

    player_who_won = start_game.find_winner
    puts "#{player_who_won} is the winner."
end

#calls the function that starts the game. 
begin_game

