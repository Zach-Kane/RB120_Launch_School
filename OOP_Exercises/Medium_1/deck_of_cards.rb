class Card
  attr_accessor :rank, :suit

  include Comparable

  CARD = { 'Jack' => 11, "King" => 12, "Queen" => 13, 'Ace' => 14 }

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
deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn == drawn2
