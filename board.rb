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


    def place_mark(index, mark)


       # Important: conversion to integer since gets.chomp returns a String
       # Subtract 1 so user input 1-9 maps correctly to array indices 0-8
       index = index.to_i - 1

       unless (0...size*size).include?(index)
        return false
       end

       row, col = index.divmod(size)

       return false if board[row][col] !=nil
       @board[row][col] = mark
       return true
    end
         
    
end

