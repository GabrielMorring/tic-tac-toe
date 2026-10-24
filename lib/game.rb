require_relative "player"

class Game
  WIN_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @current_player = 1
  end

  def play
    loop do
      # if check_winner(@player1)
      #   display_winner(@player1)
      #   break
      # end
      # if check_winner(@player2)
      #   display_winner(@player2)
      #   break
      # end

      draw_board
      if @current_player == 1
        do_turn(@player1)
        @current_player = 2
      elsif @current_player == 2
        do_turn(@player2)
        @current_player = 1
      end
    end
  end

  private

  def draw_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "---+---+---"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "---+---+---"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def do_turn(player)
    loop do
      puts "Player #{player.name}: Where would you like to go?"
      turn = gets.chomp.to_i
      unless valid_turn?(turn)
        puts "Invalid move. Try again."
        next
      end
      @board[turn - 1] = player.name
      break
    end
  end

  def valid_turn?(turn)
    return false if turn < 1 || turn > 9

    true
  end
end
