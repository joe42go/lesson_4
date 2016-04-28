# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!
require 'pry' # press 'exit-program' in command line to exit out of pry

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
CHOOSE_TURN = "choose".freeze # "choose" for turning on

def prompt(message)
  puts "=> #{message}"
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]} "
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(brd, separator= ', ', word = 'or')
  brd[-1] = "#{word} #{brd.last}" if brd.size > 1
  brd.join(separator)
end

def place_piece!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  if current_player == "Player"
    "Computer"
  else
    "Player"
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("You need to enter a number that falls within #{empty_squares(brd).join(', ')}")
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  # square = empty_squares(brd).sample
  # brd[square] = COMPUTER_MARKER
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def user_score(brd, score)
  if detect_winner(brd) == 'Player'
    score + 1
  else
    score
  end
end

def computer_score(brd, score)
  if detect_winner(brd) == 'Computer'
    score + 1
  else
    score
  end
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  prompt("Welcome to the Game of Tic-Tac-Toe")
  prompt("First player to win 5 times wins the game")

  sleep 2

  player_wins = 0
  computer_wins = 0
  first_turn = nil

  loop do
    if CHOOSE_TURN == 'choose'
      prompt("Who would like to go first? Press 'c' for Computer or 'p' for Player")
      first_turn = gets.chomp.downcase
      break if first_turn == 'c' || first_turn == 'p'
      prompt("You need choose either 'c' or 'p'")
    else
      break
    end
  end

  loop do
    board = initialize_board

    current_player = if first_turn == 'p'
                       "Player"
                     elsif first_turn == 'c'
                       "Computer"
                     else
                       "Player"
                     end

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      player_wins = user_score(board, player_wins)
      computer_wins = computer_score(board, computer_wins)
      break if someone_won?(board) || board_full?(board)

      # if first_turn == 'p'
      #   player_places_piece!(board)
      #   display_board(board)
      #   player_wins = user_score(board, player_wins)
      #   break if someone_won?(board) || board_full?(board)

      #   computer_places_piece!(board)
      #   display_board(board)
      #   computer_wins = computer_score(board, computer_wins)
      #   break if someone_won?(board) || board_full?(board)
      # elsif first_turn == 'c'
      #   computer_places_piece!(board)
      #   display_board(board)
      #   computer_wins = computer_score(board, computer_wins)
      #   break if someone_won?(board) || board_full?(board)

      #   player_places_piece!(board)
      #   display_board(board)
      #   player_wins = user_score(board, player_wins)
      #   break if someone_won?(board) || board_full?(board)
      # else
      #   player_places_piece!(board)
      #   display_board(board)
      #   player_wins = user_score(board, player_wins)
      #   break if someone_won?(board) || board_full?(board)

      #   computer_places_piece!(board)
      #   display_board(board)
      #   computer_wins = computer_score(board, computer_wins)
      #   break if someone_won?(board) || board_full?(board)
      # end
    end

    if player_wins == 5 || computer_wins == 5
      prompt("#{detect_winner(board)} won the entire game!")
      sleep 2
      break
    elsif someone_won?(board)
      prompt("#{detect_winner(board)} won this round!")
      prompt("Current Score is Player #{player_wins} vs. Computer #{computer_wins}")
      sleep 2
    else
      prompt "It's a tie!"
      sleep 2
    end
  end

  prompt("Would you like to play again? Enter 'Y' or 'N'")
  response = gets.chomp
  break unless response.downcase.start_with?('y')
end

prompt("Thank you for playing. See you next time")
