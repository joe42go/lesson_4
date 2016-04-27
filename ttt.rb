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

require 'pry'

def mark_square(player, square_choice)  # player could be human or computer
  if player == "human" 
    SQUARES[square_choice] = "X"
  else
    SQUARES[square_choice] = "O"
  end
end

def display_board_original
  puts "| --#1-- | --#2-- | --#3-- |"
  puts "| --#4-- | --#5-- | --#6-- |"
  puts "| --#7-- | --#8-- | --#9-- |"
end 

def display_board
  puts "| --#{SQUARES[1]}-- | --#{SQUARES[2]}-- | --#{SQUARES[3]}-- |"
  puts "| --#{SQUARES[4]}-- | --#{SQUARES[5]}-- | --#{SQUARES[6]}-- |"
  puts "| --#{SQUARES[7]}-- | --#{SQUARES[8]}-- | --#{SQUARES[9]}-- |"
end 

def prompt(message)
  puts "=> #{message}"
end

def board_display_full?
  !SQUARES.has_value?('') 
end

def check_winner
  if (SQUARES[1] == 'X' && SQUARES[2] == 'X' && SQUARES[3] = 'X') ||
    (SQUARES[4] == 'X' && SQUARES[5] == 'X' && SQUARES[6] = 'X') ||
    (SQUARES[7] == 'X' && SQUARES[8] == 'X' && SQUARES[9] = 'X') ||
    (SQUARES[1] == 'X' && SQUARES[5] == 'X' && SQUARES[9] = 'X') ||
    (SQUARES[3] == 'X' && SQUARES[5] == 'X' && SQUARES[7] = 'X') 
    prompt("Congrats! You won")
    true
  elsif(SQUARES[1] == 'O' && SQUARES[2] == 'O' && SQUARES[3] = 'O') ||
    (SQUARES[4] == 'O' && SQUARES[5] == 'O' && SQUARES[6] = 'O') ||
    (SQUARES[7] == 'O' && SQUARES[8] == 'O' && SQUARES[9] = 'O') ||
    (SQUARES[1] == 'O' && SQUARES[5] == 'O' && SQUARES[9] = 'O') ||
    (SQUARES[3] == 'O' && SQUARES[5] == 'O' && SQUARES[7] = 'O') 
    prompt("Sorry, you lost. Computer won")
  elsif board_display_full?
    prompt("The board is full. It's a tie")
    true
  else
    false
  end
end

prompt("Welcome to the Tic Tac Toe Game")

loop do
  display_board_original
  SQUARES = { 1 => '', 2 => '', 3 => '', 4 => '', 5 => '', 6 => '', 7 => '', 8 => '', 9 => ''}

  loop do
    prompt("Enter the numbered choice of your square (human = 'X' & robot = 'O')")

    player_choice = ''
    loop do 
      player_choice = gets.chomp.to_i
      break if (1..9).include?(player_choice)
      prompt("You need to enter a number between 1 and 9.")
    end 

    mark_square("human", player_choice)

    puts SQUARES

    display_board

    break if check_winner

    computer_choice = SQUARES.select {|k,v|
      v = ''
    }.keys.sample
    
    prompt("Computer chose #{computer_choice}")

    mark_square("computer", computer_choice)

    puts SQUARES

    display_board

    break if check_winner
  end

  prompt("Would you like to play again? Enter 'Y' or 'N' ")
  response = gets.chomp
  break if response == 'n'
end

prompt("Thank you for playing. See you next time")

