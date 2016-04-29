require 'pry'

SHAPES = %w(Hearts Diamonds Clubs Spades)
CARD_VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

# create a deck
def initialize_deck 
  deck = {}
  SHAPES.each do |shape|
    CARD_VALUES.each do |value|
      deck[shape] = value
    end
  end
  deck
end

#Final product to be {"Hearts" => '1', "Hearts" => '2'....}

deck = initialize_deck

puts deck
