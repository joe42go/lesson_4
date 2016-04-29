require 'pry'

SHAPES = %w(Hearts Diamonds Clubs Spades).freeze
CARD_VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King).freeze

# create a deck
# shuffle the deck
# pass two cards to each player
# calculate the value of cards held by player and show one of the cards held by dealer
# ask player to choose to hit or stay
# if busted or over 21, then player loses
# if choose to stay, turn goes over to the computer
# reveal both cards of the computer
# automatically hit until the computer busts or hits 17 or above
# if busts, then player wins
# if the player's score is higher than computer then player wins
# if the computer's score is higher than player's then computer wins
# if the score on each side is the same then it's a tie
# Declare results

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  SHAPES.product(CARD_VALUES)
end

def deal_cards(deck, player_hand, dealer_hand)
  player_hand << deck.shift
  dealer_hand << deck.shift
  player_hand << deck.shift
  dealer_hand << deck.shift
end

def calculate_score(hand) # input is a nested array e.g. [["Hearts", '6'], ["Diamonds", 'Jack']....]
  total = 0
  hand.each do |card|
    if card[1] == 'Ace'
      if (total + 11) > 21
        total += 1
      else
        total += 11
      end
    elsif card[1].to_i == 0
      total += 10
    else
      total += card[1].to_i
    end
  end
  total
end

def busted?(hand)
  if calculate_score(hand) > 21
    prompt("Player busted. Player loses")
    true
  end
end

def compare_hands(player_hand, dealer_hand)
  if calculate_score(player_hand) > calculate_score(dealer_hand)
    prompt("Player wins!")
  elsif calculate_score(player_hand) < calculate_score(dealer_hand)
    prompt("Dealer wins!")
  else
    prompt("It's a tie")
  end
end

prompt("Welcome to the Game of Twenty-One")
deck = initialize_deck

deck.shuffle!

loop do
  system 'clear'

  player_hand = []
  dealer_hand = []

  prompt("Passing out player's cards...")
  sleep 1

  prompt("Passing out computer's cards...")
  sleep 1

  deal_cards(deck, player_hand, dealer_hand)

  prompt("Player has: #{player_hand}")
  prompt("Dealer has: #{dealer_hand[0]} and unknown card")
  prompt("Player has a score of #{calculate_score(player_hand)}")

  action = ''
  loop do
    break if busted?(player_hand)
    prompt("Would you like to hit or stay? Press 'h' for hit and 's' for stay")
    action = gets.chomp.downcase
    if action == 'h'
      prompt("You've decided to take another card")
      player_hand << deck.shift
      prompt("Player now has: #{player_hand}")
      prompt("Player has a score of #{calculate_score(player_hand)}")
    elsif action == 's'
      prompt("Player decided to stay")
      break
    else
      prompt("Can't reconize your command. You need to enter either 'h' or 's'.")
    end
  end

  if action == 's'
    prompt("Dealer's full hand: #{dealer_hand}")
    prompt("Dealer has a score of #{calculate_score(dealer_hand)}")
    loop do
      if calculate_score(dealer_hand).between?(17, 21)
        compare_hands(player_hand, dealer_hand)
        break
      elsif calculate_score(dealer_hand) < 17
        prompt("Dealer is taking another card...")
        sleep 2
        dealer_hand << deck.shift
        prompt("Dealer's hand: #{dealer_hand}")
        prompt("Dealer has a score of #{calculate_score(dealer_hand)}")
      else
        prompt("Dealer busted. Player wins!")
        break
      end
    end
  end

  prompt("Would you like to play again? Press 'y' to continue or 'n' to quit")
  response = gets.chomp.downcase
  break unless response.start_with?('y')
end

prompt("Thank you for playing. See you next time!")
