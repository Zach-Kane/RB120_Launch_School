class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must have a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? choice
      puts "Sorry, invalid choice"
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", "Johnny 5", "Hal"].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a Tie" if computer.move == 'rock'
      puts "You win!" if computer.move == 'scissors'
      puts "Computer wins" if computer.move == 'paper'
    when 'paper'
      puts "Tie" if computer.move == 'paper'
      puts "You win!" if computer.move == 'rock'
      puts "Computer wins" if computer.move == 'scissors'
    when 'scissors'
      puts "Tie" if computer.move == 'scissors'
      puts "You win!" if computer.move == 'paper'
      puts "Computer wins" if computer.move == 'rock'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n"
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    loop do
      display_welcome_message
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play