class TicTacToe

    attr_accessor :board_size, :board

    def initialize
        @board_size = 5
        @board = Array.new(board_size) {Array.new(board_size)} # Holds instantiated board
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
end

board = TicTacToe.new
board.setBoard
board.printBoard
