SUITS = ['H', 'D', 'S', 'C'].freeze
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'A'].freeze
MAXIMUM_WINS = 5.freeze
MAXIUM_NUMBER = 21.freeze
DEALER_MINIMUM = 17.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
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

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > MAXIUM_NUMBER
  end

  sum
end

def busted?(cards)
  total(cards) > MAXIUM_NUMBER
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > MAXIUM_NUMBER
    :player_busted
  elsif dealer_total > MAXIUM_NUMBER
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def player_keep_score(player_wins, dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards) 

  case result
  when :dealer_busted
    player_wins + 1
  when :player
    player_wins + 1
  else
    player_wins
  end
end

def computer_keep_score(computer_wins, dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards) 

  case result
  when :player_busted
    computer_wins + 1
  when :dealer
    computer_wins + 1
  else
    computer_wins
  end
end

def display_score(player_wins, computer_wins) # keeps track of number of wins for each side
  if player_wins == MAXIMUM_WINS
    puts "================================================"
    prompt("Congratulations, Player collected #{MAXIMUM_WINS} wins. Player won the entire game!")
    puts "================================================"
  elsif computer_wins == MAXIMUM_WINS
    puts "================================================"
    prompt("Sorry, Computer has won #{MAXIMUM_WINS} times before you #sad_day")
    puts "================================================"
  else
    puts "================================================"
    prompt("Current Score is #{player_wins}(User):#{computer_wins}(Computer)")
    puts "================================================"
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  else
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
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "================================================"
end

loop do
  prompt "Welcome to Twenty-One!"
  prompt "Objective is to win 5 times before the computer does"

  sleep 2

  deck = initialize_deck

  player_wins = 0
  computer_wins = 0
  loop do
    sleep 3

    system 'clear'

    player_cards = []
    dealer_cards = []

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{total(player_cards)}."

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
        prompt "Your cards are now: #{player_cards}"
        prompt "Your total is now: #{total(player_cards)}"
      end

      break if player_turn == 's' || busted?(player_cards)
    end

    if busted?(player_cards)
      display_result(dealer_cards, player_cards)
      display_grand_output(dealer_cards, player_cards)
      computer_wins = computer_keep_score(computer_wins, dealer_cards, player_cards)
      display_score(player_wins, computer_wins)
      computer_wins == MAXIMUM_WINS ? break : next
      # play_again? ? next : break 
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
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    dealer_total = total(dealer_cards)
    if busted?(dealer_cards)
      prompt "Dealer total is now: #{dealer_total}"
      display_grand_output(dealer_cards, player_cards)
      display_result(dealer_cards, player_cards)
      player_wins = player_keep_score(player_wins, dealer_cards, player_cards)
      display_score(player_wins, computer_wins)
      player_wins == MAXIMUM_WINS ? break : next
      #play_again? ? next : break
      next
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    display_grand_output(dealer_cards, player_cards)

    # puts "================="
    # prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
    # prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
    # puts "================="

    display_result(dealer_cards, player_cards)
    player_wins = player_keep_score(player_wins, dealer_cards, player_cards)
    computer_wins = computer_keep_score(computer_wins, dealer_cards, player_cards)
    display_score(player_wins, computer_wins)

    break if player_wins == MAXIMUM_WINS || computer_wins == MAXIMUM_WINS
  end

  break unless play_again? 
end

prompt "Thank you for playing Twenty-One! Good bye!"
