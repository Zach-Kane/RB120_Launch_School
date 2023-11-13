=begin

guessin game is a game where a player guesses the number the PC has selected.
the player is given 7 chances to guess the number
the chances remaining is displayed
if the number is too high the PC says too high
  if the number is too low the PC says to low.
    if there ae no more guesses gamae end and player displays as lost

if player wins (chooses corerct number) game is over and winner displayed.

game player computer number
chances choice display (high / low) display/loss display/win
=end



class Player
  attr_accessor :choice, :attempts, :low, :high, :number

  def initialize
    @choice = nil
    @attempts = nil
    @number = nil
    @low = nil
    @high = nil
  end

  def get_number
    puts "Welcome to make a guess"
    puts "please choose 2 numbers, one low and one high."
    num1 = nil
    num2 = nil
    loop do
      puts "Number 1"
      num1 = gets.chomp
      puts "Number 2"
      num2 = gets.chomp
      break if num1.to_i.to_s == num1 && num2.to_i.to_s == num2
      puts "Not valid numbers"
    end
    self.low = num1.to_i
    self.high = num2.to_i
    self.number = [*low..high].sample
    self.attempts = Math.log2(high - low).to_i + 1
  end


  def choose
    input = nil
    loop do
      puts "Please choose a number between #{low} and #{high}."
      puts "You have #{attempts} attempts left"
      input = gets.chomp
      break if input.to_i.to_s == input && (low..high).include?(input.to_i)
      puts "Not a valid choice"
    end
    self.choice = input.to_i
    self.attempts -= 1
  end

  def to_s
    choice.to_s
  end
end

class GuessingGame
  attr_accessor :player, :attempts

  def number_of_attempts
    loop do
      puts
    end
  end

  def initialize
    @player = Player.new
  end

  def display_high_or_low
    puts "Your guess is too high" if player.choice > player.number
    puts "Your guess is too low" if player.choice < player.number
  end

  def win?
    return unless player.choice == player.number
    puts "Congrats, you win and are the best guesser!"
    true
  end

  def too_many_attempts
    return unless player.attempts == 0
    puts "Too many attempts, you lose!"
    puts "The number was #{player.number}"
    true
  end

  def play
    player.get_number
    loop do
      player.choose
      display_high_or_low
      break if win?
      break if too_many_attempts
    end
  end
end

game = GuessingGame.new
game.play
