class Board
    attr_accessor :size, :board

    def initialize(size)
        @size = size
        @board = Array.new(size) { Array.new(size) }
    end

    def draw
        (0...size).times |i|
          (0...size).times |j|
            print "#{board[i][j]}\t"
          end
          puts "---------------------"
        end
    end
    
    

          
         
    
end

