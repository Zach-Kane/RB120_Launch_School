class Card
  attr_accessor :rank, :suit

  include Comparable

  CARD = { 'Jack' => 11, "Queen" => 12, "King" => 13, 'Ace' => 14 }

  def initialize(ranks, suits)
    @rank = ranks
    @suit = suits
  end

  def value
    CARD.fetch(rank, rank)
  end

  def to_s
    "#{rank}, #{suit}"
  end

  def <=>(other)
    value <=> other.value
  end
end

class Deck
  attr_accessor :deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    make_deck
  end

  def make_deck
    RANKS.each do |ranks|
      SUITS.each do |suits|
        deck << Card.new(ranks, suits)
      end
    end
    shuffle_deck
  end

  def shuffle_deck
    deck.shuffle!
  end

  def draw
    make_deck if deck.empty?
    deck.pop
  end
end

#p Deck.new.deck
# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# p drawn != drawn2


# Include Card and Deck classes from the last two exercises.

class PokerHand 
  attr_accessor :deck, :hand

  def initialize(deck)
    @deck = deck
    @hand = []
    5.times { hand << deck.draw }
  end

  def print
    hand.sort
    
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    counts = hand.map {|card| card.value}.sort
    counts == [10, 11, 12, 13, 14] &&
      hand.all? { |card| card.suit == hand[0].suit }
  end

  def straight_flush?
    straight = hand.sort
    4.times do |i|
      return false if straight[i].value.next != straight[i + 1].value
    end
    hand.all? { |card| card.suit == hand[0].suit }
  end

  def four_of_a_kind?
    fours = hand.map {|card| card.value}
    fours.any? { |num| fours.count(num) == 4 }
  end

  def full_house?
    full = hand.map {|card| card.value}
    full.any? { |num| full.count(num) == 3 } &&
      full.any? { |num| full.count(num) == 2 }
  end

  def flush?
    hand.all? { |card| card.suit == hand[0].suit }
  end

  def straight?
    straight = hand.sort
    4.times do |i|
      return false if straight[i].value.next != straight[i + 1].value
    end
    true
  end

  def three_of_a_kind?
    counts = hand.map {|card| card.value}
    counts.map! {|num| counts.count(num)}.count(3) == 3
  end

  def two_pair?
    values = hand.map {|card| card.value}
    values.map {|value| values.count(value)}.count(2) == 4
    

  end

  def pair?
    values = hand.map {|card| card.value}
    values.any? {|value| values.count(value) == 2}
  end
end

hand = PokerHand.new(Deck.new)

puts hand.print
puts hand.evaluate

puts '****'

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

hand = PokerHand.new([
  Card.new(4,      'Hearts'),
  Card.new(1,   'Diamonds'),
  Card.new(2, 'Hearts'),
  Card.new(2,  'Clubs'),
  Card.new(2,  'Hearts')
])
puts hand.evaluate

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
#hand.hand.each {|card| puts card.value}
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'