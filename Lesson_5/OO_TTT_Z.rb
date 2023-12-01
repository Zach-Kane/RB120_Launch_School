=begin
tics tac toe, a game where two player choose squares (x or o) on a board. 
first plyer to get 3 squares in a row wins.
game players(2) squares board
play choose wins
=end

class Board
  attr_accessor :state

  INITIAL_STATE = " "

  def initialize
    set_state
  end

  def set_state
    @state = {}
    (1..9).each do |ea|
      state[ea] = INITIAL_STATE
    end
  end

  def display
    a = "     |     |     "
    b = "  #{state[1]}  |  #{state[2]}  |  #{state[3]}   "
    c = "-----+-----+-----"
    d = "  #{state[4]}  |  #{state[5]}  |  #{state[6]}   "
    e = "  #{state[7]}  |  #{state[8]}  |  #{state[9]}   "

    board = [a,b,a,c,a,d,a,c,a,e,a]
    puts board
  end

  # def display
  #   puts ""
  #   puts "     |     |     "
  #   puts "  #{state[1]}  |  #{state[2]}  |  #{state[3]}   "
  #   puts "     |     |     "
  #   puts "-----+-----+-----"
  #   puts "     |     |     "
  #   puts "  #{state[4]}  |  #{state[5]}  |  #{state[6]}   "
  #   puts "     |     |     "
  #   puts "-----+-----+-----"
  #   puts "     |     |     "
  #   puts "  #{state[7]}  |  #{state[8]}  |  #{state[9]}   "
  #   puts "     |     |     "
  # end
end

class Player
  attr_accessor :name, :squares, :winning_lines

  def initialize
    @squares = []
    set_name
    @winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                     [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                     [[1, 5, 9], [3, 5, 7]]
  end

  def mark_line(move)
    winning_lines.each do |line|
      line.delete(move)
    end
  end

  def winner?
    winning_lines.any?(&:empty?)
  end
end

class Human < Player
  def set_name
    input = nil
    loop do
      puts "Please enter your name"
      input = gets.chomp.to_s
      break unless input.nil?
      "Not a valid name"
    end
    self.name = input
  end

  def move(board)
    input = nil
    loop do
      puts "Please make a choice (1-9)"
      input = gets.chomp.to_i
      break if (1..9).any?(input) && board.state[input] == " "
      puts "Not a valid choice"
    end
    board.state[input] = 'X'
    mark_line(input)
    winner?
    # << input
  end
end

class Computer < Player
  def set_name
    self.name = ["Cyborg", "Cyborg II", "ChatGPT"].sample
  end

  def defense 
  end

  def move(board)
    move = (board.state.select { |_, v| v == " " }).keys.sample
    board.state[move] = 'O'
    mark_line(move)
    winner?
    p winning_lines
    #squares << move
  end
end

class TTTGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome
    puts "Welome to Tic Tac Toe, get ready to play!"
  end

  def play_round(board)
    loop do
      board.display
      human.move(board)
      p human.squares
      break if human.winner?
      computer.move(board)
      break if computer.winner?
    end
  end

  def play_again?
    loop do
      puts "Would you like to play again (y/n)"
      input = gets.chomp.downcase
      return true if input == 'y'
      return false if input == 'n'
      puts "not a valid input"
    end
  end

  def reset_squares
    human.squares = []
    computer.squares = []
  end

  def goodbye
    puts "Thanks for playing, have a great day!"
  end

  def play
    display_welcome

    loop do
      reset_squares
      board = Board.new

      play_round(board)

      board.display

      break unless play_again?
    end

    goodbye
  end
end

TTTGame.new.play
