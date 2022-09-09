class Player
  attr_reader :marker, :name

  def initialize(tictactoe, marker, name)
    @tictactoe = tictactoe
    @marker = marker
    @name = name
  end

  def choose_position
    loop do
      puts "#{@name}, choose a number from the available positions:"
      chosen_position = gets.chomp.to_i
      return chosen_position if @tictactoe.available_positions.include?(chosen_position)

      puts "\nInvalid input."
    end
  end
end

class TicTacToe
  WIN_COMBINATIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 5, 9],
    [3, 5, 7],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9]
  ]

  attr_reader :available_positions

  def initialize
    @players = [
      Player.new(self, 'x', 'Player_1'),
      Player.new(self, 'o', 'Player_2')
    ]
    @current_player = @players[0]
    @board = %w[1 2 3 4 5 6 7 8 9]
    @available_positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def play

    puts "|=============================|"
    puts "|======== TIC TAC TOE ========|"
    puts "|=============================|"
    puts ''
    puts "\nWelcome to Tic Tac Toe game!\n"
    sleep(2)
    loop do
      puts "\nGame board:"
      print_board
      sleep(0.5)
      chosen_position = @current_player.choose_position
      update_available_positions(chosen_position)
      @board[chosen_position - 1] = @current_player.marker

      if winner?(@current_player)
        print_board
        sleep(0.5)
        puts "The winner is #{@current_player.name}!"
        play_again?
      elsif draw?
        print_board
        sleep(0.5)
        puts "It's a draw!"
        play_again?
      end

      switch_player
    end
  end

  def print_board
    divider = '--+---+--'
    puts "\n#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts divider
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts divider
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}\n\n"
  end

  def update_available_positions(pos)
    @available_positions.delete(pos)
  end

  def winner?(player)
    WIN_COMBINATIONS.any? do |combination|
      combination.all? { |pos| @board[pos - 1] == player.marker }
    end
  end

  def draw?
    @available_positions.empty?
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def play_again?
    loop do
      print "\nPlay again? y/n:"
      answer = gets.chomp.downcase
      if answer == 'n'
        exit
      elsif answer == 'y'
        initialize
        play
      end
    end
  end
end

new_game = TicTacToe.new
new_game.play
