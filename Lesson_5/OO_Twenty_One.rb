class Deck
  attr_reader :cards

  SUITS = ['♠', '♥', '♦', '♣']
  FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  KEYS = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }

  def initialize
    @cards = []
    make_deck
    shuffle_deck!
  end

  def deal_card
    cards.pop
  end

  private

  def make_deck
    SUITS.each do |suit|
      FACES.each do |face|
        cards << [suit, face]
      end
    end
  end

  def shuffle_deck!
    cards.shuffle!
  end
end

module Cards
  def show_cards(hide_card: false)
    show_hand = hand.dup
    show_hand[1] = ['?', '?'] if hide_card
    puts make_all_cards(show_hand)
  end

  private

  def make_a_card(card)
    space = ' '
    space = '' if card[1] == 10
    ["_______ ",
     "|#{card[1]}#{space}   | ",
     "|     | ",
     "|  #{card[0]}  | ",
     "|     | ",
     "|   #{card[1]}#{space}| ",
     "------- "]
  end

  def make_all_cards(show_hand)
    cards = ['', '', '', '', '', '', '']
    show_hand.each do |card|
      index = 0
      make_a_card(card).each do |line|
        cards[index] << line
        index += 1
      end
    end
    cards
  end
end

class Player
  attr_accessor :hand, :temp_hand, :name, :score

  include Cards

  def initialize
    @hand = []
  end

  def deal(deck)
    2.times { hand << deck.deal_card }
  end

  def calculate_hand
    self.temp_hand = convert_hand
    aces_total
  end

  def to_s
    "#{name}'s Hand: #{calculate_hand}"
  end

  def hit(deck)
    hand << deck.deal_card
  end

  def reset_hand
    self.hand = []
    self.temp_hand = nil
  end

  private

  def hand_total
    total = 0
    temp_hand.each do |card|
      total += card[1]
    end
    total
  end

  def convert_hand
    hand.map do |card|
      if Deck::KEYS[card[1]]
        [card[0], Deck::KEYS[card[1]]]
      else
        card
      end
    end
  end

  def aces_total
    while hand_total > 21 && temp_hand.any? { |card| card[1] == 11 }
      temp_hand.each do |card|
        card[1] = 1 if hand_total > 21 && card[1] == 11
      end
    end
    hand_total
  end
end

class Human < Player
  attr_accessor :rounds

  def initialize
    super
    set_name
  end

  def hit?(deck)
    loop do
      return false if bust?
      puts " "
      puts "Would you like Hit(1) or Stay(2)?"
      input = gets.chomp.to_s
      hit(deck) if input == '1'
      return true if input == '1'
      return false if input == '2'
      puts "Not a valid answer"
    end
  end

  def set_rounds
    @rounds = nil
    loop do
      puts "How many rounds should we play? (Max 10)"
      self.rounds = gets.chomp.to_i
      break if (1..10).include?(rounds)
      puts "Not a valid number"
    end
  end

  def bust?
    hand_total > 21
  end

  private

  def set_name
    system 'clear'
    input = nil
    puts "Welcome to the Game of Twenty One!"
    loop do
      puts "Please enter your name"
      input = gets.chomp.capitalize
      break unless input.nil?
      puts "Not a valid input"
    end
    self.name = input
  end
end

class Computer < Player
  def initialize
    @name = "Dealer"
    super
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer, :player_final, :dealer_final

  def initialize
    @deck = Deck.new
    @player = Human.new
    @dealer = Computer.new
  end

  def deal_cards
    player.deal(deck)
    dealer.deal(deck)
  end

  def show_score
    puts "First Player to #{player.rounds} Rounds Wins!"
    puts "#{player.name}: #{player.score}, " \
         "#{dealer.name}: #{dealer.score}"
    puts " "
  end

  def deal_animation
    size = 1
    3.times do
      system 'clear'
      puts "Dealing cards#{'.' * size}"
      sleep(0.5)
      size += 1
    end
  end

  def player_turn
    loop do
      system 'clear'
      puts "** The Game of Twenty One **"
      show_score
      puts player
      player.show_cards
      puts "Dealer's Hand: ??"
      dealer.show_cards(hide_card: true)
      break unless player.hit?(deck)
    end
  end

  def dealer_turn
    loop do
      break if player.calculate_hand > 21
      break if dealer.calculate_hand > 16
      dealer.hit(deck)
    end
  end

  def animate_results(result)
    num = 1
    5.times do
      system 'clear'
      puts "#{'*' * num} #{result} #{'*' * num}"
      results
      sleep(0.3)
      num += 1
    end
  end

  def player_bust
    return unless player_final > 21
    dealer.score += 1
    animate_results("You Bust, Dealer Wins!!")
  end

  def dealer_bust
    return unless dealer_final > 21
    player.score += 1
    animate_results("Dealer Busts, You Win!!")
  end

  def player_win
    return unless player_final > dealer_final && player_final < 22
    player.score += 1
    animate_results("You Win!!")
  end

  def dealer_win
    return unless dealer_final > player_final && dealer_final < 22
    dealer.score += 1
    animate_results("Dealer Wins!!")
  end

  def draw
    return unless player_final == dealer_final
    animate_results("Its a Draw!!")
  end

  def key_to_continue
    puts "Press any key to continue"
    gets.chomp
  end

  def declare_winner
    self.player_final = player.calculate_hand
    self.dealer_final = dealer.calculate_hand
    player_bust
    dealer_bust
    player_win
    dealer_win
    draw
  end

  def results
    show_score
    puts player
    player.show_cards
    puts dealer
    dealer.show_cards
  end

  def end_game
    if player.rounds == player.score
      puts "#{player.name} Wins the Game!!"
      true
    elsif player.rounds == dealer.score
      puts "Dealer Wins the Game!!"
      true
    else
      false
    end
  end

  def play_round
    deal_animation
    deal_cards
    player_turn
    dealer_turn
    declare_winner
  end

  def play_again?
    loop do
      puts "Would you like to play again? (y/n)"
      input = gets.chomp.downcase
      return true if input.include?('y')
      break if input.include?('n')
      puts "Sorry not a valid response"
    end
    puts "Thanks for playing, have a great day!"
  end

  def reset_round
    @deck = Deck.new
    player.reset_hand
    dealer.reset_hand
  end

  def set_game
    player.set_rounds
    player.score = 0
    dealer.score = 0
  end

  def play
    loop do
      set_game
      loop do
        play_round
        reset_round
        break if end_game
        key_to_continue
      end
      break unless play_again?
    end
  end
end

TwentyOne.new.play
