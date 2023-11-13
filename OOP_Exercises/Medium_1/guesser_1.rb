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
  attr_accessor :choice, :attempt

  def initialize
    @choice = nil
    @attempt = 0
  end

  def choose
    input = nil
    loop do
      puts "Please choose a number between 1 and 100"
      input = gets.chomp
      break if input.to_i.to_s == input && (1..100).include?(input.to_i)
      puts "Not a valid choice"
    end
    self.choice = input.to_i
    self.attempt += 1
  end

  def to_s
    choice.to_s
  end
end

class GuessingGame
  MAX_GUESSES = 7
  attr_accessor :player, :number

  def initialize
    @player = Player.new
    @number = [*1..100].sample
  end

  def display_high_or_low
    puts "Your guess is too high" if player.choice > number
    puts "Your guess is too low" if player.choice < number
  end

  def win?
    return unless player.choice == number
    puts "Congrats, you win and are the best guesser!"
    true
  end

  def too_many_attempts
    return unless player.attempt == MAX_GUESSES
    puts "Too many attempts, you lose!"
    puts "The number was #{number}"
    true
  end

  def play
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
