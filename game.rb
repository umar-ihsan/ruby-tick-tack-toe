require_relative 'board'
require_relative 'player'

class Game
  def initialize
   
    @board = Board.new(3)
    @player_one = Player.new(1, "Andy", "O")
    @player_two = Player.new(2, "Bob", "X") 
    @player_one_turn = true
    @game_on = true
    @turn_count = 0
  end

  def turn_toggle
    @player_one_turn = !@player_one_turn
  end

  def current_player
    return @player_one if @player_one_turn
    @player_two
  end

  def input_choice()

    puts "Player 1 choose your box (1-9): " if @player_one_turn
    puts "Player 2 choose your box (1-9): " unless @player_one_turn
    p_choice = gets.chomp
    
    
     mark = current_player.sign
    

    result = @board.place_mark(p_choice,mark)
    unless result
        puts "square is already filled or you input invalid number, try again"
        input_choice()
    end

  end

  def check_win
    winner = 0
    temp_board = @board.board.flatten

    # Row checks
    if temp_board[0] != nil && temp_board[0] == temp_board[1] && temp_board[1] == temp_board[2]
      winner = temp_board[0]
    elsif temp_board[3] != nil && temp_board[3] == temp_board[4] && temp_board[4] == temp_board[5]
      winner = temp_board[3] 
    elsif temp_board[6] != nil && temp_board[6] == temp_board[7] && temp_board[7] == temp_board[8]
      winner = temp_board[6]
    # Column checks
    elsif temp_board[0] != nil && temp_board[0] == temp_board[3] && temp_board[3] == temp_board[6]
      winner = temp_board[0]
    elsif temp_board[1] != nil && temp_board[1] == temp_board[4] && temp_board[4] == temp_board[7]
      winner = temp_board[1] 
    elsif temp_board[2] != nil && temp_board[2] == temp_board[5] && temp_board[5] == temp_board[8]
      winner = temp_board[2] 
    # Diagonal checks
    elsif temp_board[0] != nil && temp_board[0] == temp_board[4] && temp_board[4] == temp_board[8]
      winner = temp_board[0] 
    elsif temp_board[2] != nil && temp_board[2] == temp_board[4] && temp_board[4] == temp_board[6]
      winner = temp_board[2]
    end 

    if winner != 0
      @board.draw() # Draw final winning layout
      winner_number = current_player.num
      winner_name = current_player.name
      puts "Congrats! Player#{winner_number}: #{winner_name}, you have won!"
      @game_on = false
    end
  end

  def run_game

    while @game_on
      @board.draw()
      if @turn_count >= @board.size * @board.size
        @game_on = false
        puts"Game Draw! Try Again"
        return
      end

      input_choice()
      check_win()
      @turn_count += 1
      
      # Only switch turns if the game is still active
      turn_toggle() if @game_on 
    end
  end
end

# Kickstart the game execution
game = Game.new
game.run_game
