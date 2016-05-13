require 'pry'

SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
MAXIMUM_WINS = 5
MAXIMUM_NUMBER = 21
DEALER_MINIMUM = 17

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def reformat_cards(cards) # convert [['H', 'A'], ['D', '7'], ['S', '4']....['S', 'Q']] to "A, 7, 4...., Q"
  result = ""
  cards.each_with_index do |card, idx|
    result += card[1] + ", " unless idx == (cards.size - 1)
  end
  result += cards[cards.size - 1][1]
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.each do
    sum -= 10 if sum > MAXIMUM_NUMBER
  end

  sum
end

def busted?(cards)
  total(cards) > MAXIMUM_NUMBER
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAXIMUM_NUMBER
    :player_busted
  elsif dealer_total > MAXIMUM_NUMBER
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

# def calculate_wins(player_wins, computer_wins, dealer_cards, player_cards)
#   case detect_result(dealer_cards, player_cards)
#   when :player, :dealer_busted then player_wins + 1
#   when :dealer, :player_busted then computer_wins + 1
#   end
# end

def display_score(player_wins, computer_wins) # keeps track of number of wins for each side
  puts "================================================"
  if player_wins == MAXIMUM_WINS
    prompt("Congratulations, Player collected #{MAXIMUM_WINS} wins. Player won the entire game!")
  elsif computer_wins == MAXIMUM_WINS
    prompt("Sorry, Computer has won #{MAXIMUM_WINS} times before you #sad_day")
  else
    prompt("Current Score is #{player_wins}(User):#{computer_wins}(Computer)")
  end
  puts "================================================"
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    display_grand_output(dealer_cards, player_cards)
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    display_grand_output(dealer_cards, player_cards)
    prompt "Dealer busted! You win!"
  when :player
    display_grand_output(dealer_cards, player_cards)
    prompt "You win!"
  when :dealer
    display_grand_output(dealer_cards, player_cards)
    prompt "Dealer wins!"
  else
    display_grand_output(dealer_cards, player_cards)
    prompt "It's a tie!"
  end
end

def play_again?
  puts "------------------------------------------------"
  prompt "Do you want to play again? (y or no)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_grand_output(dealer_cards, player_cards)
  puts "================================================"
  prompt "Dealer has #{reformat_cards(dealer_cards)}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{reformat_cards(player_cards)}, for a total of: #{total(player_cards)}"
  puts "================================================"
end

loop do
  prompt "Welcome to Twenty-One!"
  prompt "Objective is to win 5 times before the computer does"

  sleep 1

  deck = initialize_deck

  player_wins = 0
  computer_wins = 0
  loop do
    sleep 3

    clear_screen

    player_cards = []
    dealer_cards = []

    if deck.count < 10
      deck = initialize_deck
    end

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    prompt "Dealer has #{dealer_cards[0][1]} and ?"
    prompt "You have: #{player_cards[0][1]} and #{player_cards[1][1]}, for a total of #{total(player_cards)}."

    loop do
      player_turn = nil
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'"
      end

      if player_turn == 'h'
        player_cards << deck.pop
        prompt "You chose to hit!"
        prompt "Your cards are now: #{reformat_cards(player_cards)}"
        prompt "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      display_result(dealer_cards, player_cards)
      computer_wins += 1
      display_score(player_wins, computer_wins)
      computer_wins == MAXIMUM_WINS ? break : next
      next
    else
      prompt "You stayed at #{total(player_cards)}"
    end

    # dealer turn
    prompt "Dealer turn..."

    loop do
      break if busted?(dealer_cards) || total(dealer_cards) >= DEALER_MINIMUM

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      prompt "Dealer's cards are now: #{reformat_cards(dealer_cards)}"
    end

    dealer_total = total(dealer_cards)
    if busted?(dealer_cards)
      prompt "Dealer total is now: #{dealer_total}"
      display_result(dealer_cards, player_cards)
      player_wins += 1
      display_score(player_wins, computer_wins)
      player_wins == MAXIMUM_WINS ? break : next
      next
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    display_result(dealer_cards, player_cards)
    winner = detect_result(dealer_cards, player_cards) 
    case winner
    when :dealer_busted, :player then player_wins += 1 
    when :player_busted, :dealer then computer_wins += 1
    end
    display_score(player_wins, computer_wins)

    break if player_wins == MAXIMUM_WINS || computer_wins == MAXIMUM_WINS
  end

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
