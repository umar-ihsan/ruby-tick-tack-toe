class Board
    attr_accessor :size, :board

    def initialize(size)
        @size = size
        @board = Array.new(size) { Array.new(size) }
    end

    def draw
        size.times do |i|
            board_row = board[i].map {|cell| cell.to_s}.join(" | ")
            puts "#{board_row}"

            if i < size - 1
                divider_size = (size * 3) - 1
                puts "-" * divider_size
            end
        end
    end
         
    
end

