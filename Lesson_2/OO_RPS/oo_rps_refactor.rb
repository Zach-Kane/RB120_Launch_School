class Moves
  attr_reader :move, :name

  WINNERS = {
    '1' => ['Rock', ['Scissors', 'Lizard']],
    '2' => ['Paper', ['Rock', 'Spock']],
    '3' => ['Scissors', ['Paper', 'Lizard']],
    '4' => ['Spock', ['Scissors', 'Rock']],
    '5' => ['Lizard', ['Spock', 'Paper']]
  }

  def initialize(move)
    @move = move
    @name = WINNERS[move][0]
  end

  def win?(other_player)
    WINNERS[move][1].include?(other_player.move.name)
  end
end

class History
  attr_accessor :round, :moves

  def initialize
    @moves = []
    @round = 1
  end

  def track(human, computer)
    moves << [
      human.name, human.move.name, computer.name, computer.move.name, round
    ]
  end

  def show
    moves.each do |round|
      puts "Round #{round[4]}: #{round[0]} - #{round[1]}, #{round[2]} - #{round[3]}"
    end
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
    @move = nil
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp.capitalize
      break unless n.empty?
      puts "Sorry, you must have a name"
    end
    self.name = n
  end

  def choose
    input = nil
    loop do
      puts "Please make a choose:"
      puts "1) Rock, 2) Paper, 3) Scissors, 4) Spock, 5) Lizard"
      input = gets.chomp.to_s
      break if Moves::WINNERS.keys.include?(input)
      puts "Sorry, invalid choice"
    end
    self.move = Moves.new(input)
  end
end

class Computer < Player
  def set_name
    self.name = ["Cyborg", "Cyborg II", "ChatGPT"].sample
  end

  def choose
    self.move = Moves.new(Moves::WINNERS.keys.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer, :history

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Spock, Lizard!!"
    puts "Frist player to 5 wins!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Good bye!"
  end

  def display_move
    puts "#{human.name} chose: #{human.move.name}."
    puts "#{computer.name} chose: #{computer.move.name}."
  end

  def score
    puts "Score:"
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
  end

  def display_winner
    if human.move.win?(computer)
      human.score += 1
      puts "#{human.name} won!"
    elsif computer.move.win?(human)
      computer.score += 1
      puts "#{computer.name} won!"
    else
      puts "It's a tie!!"
    end
    score
  end

  def winner?
    human.score == 5 || computer.score == 5
  end

  def round_winner
    if human.score == 5
      puts "#{human.name} wins!"
    else
      puts "Sorry #{human.name}, better luck next time"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n"
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def round
    human.score = 0
    computer.score = 0
    loop do
      human.choose
      computer.choose
      system('clear')
      display_move
      display_winner
      history.track(human, computer)
      history.round += 1
      break if winner?
    end
  end

  def play
    loop do
      system('clear')
      display_welcome_message
      round
      round_winner
      history.show
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
