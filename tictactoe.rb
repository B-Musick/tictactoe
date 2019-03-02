require 'byebug'

class TicTacToe

    attr_accessor :board_size, :board, :current_player
    attr_reader :player_one, :player_two

    def initialize
        @board_size = 5
        @board = Array.new(board_size) {Array.new(board_size)} # Holds instantiated board
        
        @player_one = "O"
        @player_two = "X"
        @current_player = @player_one
    end

    def setBoard 
        
        # Sets the board values
        (0...self.board_size).each do |row|
            (0...self.board_size).each do |col|
                if row%2==0
                    if col.even?
                        self.board[row][col] = " "
                    else
                        self.board[row][col] = "|"
                    end
                else
                    self.board[row][col] = "-"
                end
            end
        end
        self.board
    end

    def printBoard
        board_str = ""
        (0...self.board_size).each do |row|
            (0...self.board_size).each do |col|
                if col < self.board_size-1
                    board_str+=self.board[row][col]
                else 
                    board_str+=self.board[row][col]+="\n"
                end
            end
        end
        puts board_str
    end

    def prompt
        # Prompt the user to enter a coordinate
        #debugger
        # Below is a hash which is used to set the appropriate grid space
        place = {"TL" => [0,0], "TC" => [0,2], "TR" => [0,4],
                "ML" => [2,0], "MC" => [2,2], "MR" => [2,4],
                "BL" => [4,0], "BC" => [4,2], "BR" => [4,4]}
        
        choice = ""
        while choice == ""
            # While a choice hasnt been made
            puts "Pick an empty space. Top-right = \"TR\", bottom-left = \"BL\", etc. "
            choice = gets.chomp.to_s # Takes user input, removes the newline character (chomp)
            puts choice
            if !place.has_key?(choice)
                # If the choice isnt a key in place hash then keep loop going
                choice == ""
            end
        end
        puts self.current_player
        self.setLetter(place[choice],self.current_player) # Set the letter on the board
        self.setTurn # Change turn to new person

    end

    def setLetter(pos,letter)
        self.board[pos[0]][pos[1]] = letter
    end

    def setTurn
        # Sets the turn to the person who is not the current player
        if self.current_player == self.player_one
            self.current_player = self.player_two
        else
            self.current_player = self.player_one 
        end
    end

    def play 
        # Play a round of tictactoe
        # This ends when all spaces in grid dont have empty string
    end
end

board = TicTacToe.new
board.setBoard
board.printBoard
board.prompt
board.printBoard
