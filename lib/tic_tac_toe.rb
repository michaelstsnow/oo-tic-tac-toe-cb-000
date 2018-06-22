class TicTacToe
  def initialize
    #Lets set the initial board blank
    @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    play
  end

# Winning Combinations
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagnol One
  [6,4,2], #Diagnol Two
]

# This method displays the board
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#convert the users input tp an index
def input_to_index(user_input)
  user_input.to_i - 1
end

#Converts the user input to an index
def move(index, the_player)
  @board[index] = the_player
end

#return true if the position is equal to anything besides open
def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

#returns if it is a valid ove or not
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

#defines a single turn or asking for a valid input and playing a move
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player = current_player
    move(index, player)
    display_board
    return @board
  else
    turn
  end
end

#counts how many turns have occured
def turn_count
  turns=0
  @board.each do |position|
    if position == "X" || position == "O"
      turns += 1
    else
    end
  end
  return turns
end

#returns whos turn it is x = even turns
def current_player
  turns = turn_count
  whose_turn = turns.even? ? "X" : "O"
  return whose_turn
end

#checks to see if the game is won yet
#true returns wining combo
#false returns false
def won?
  #this tests to see if the board has any winning combos
  final_decision = false
  winning_combo=[]
  WIN_COMBINATIONS.each do |win_combination|
    if @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
    final_decision = true
    winning_combo = win_combination
    else
    end
  end
  #check what to return
  if final_decision
    return winning_combo
  else
    return final_decision
  end
end

#check to see if the board is full
def full?
  #Seeing if the board is full or not
@board.all? { |position|
  !(position.nil? || position == " " || position == "")
}
end

#checking to see if there is a draw
def draw?
  #Tests if the board is in a draw state by seing if it is full and not won
  if full? & !(won?)
    return true
  else
    return false
  end
end

#checks to see if the game is over by draw of won
def over?
  if draw? || won?
    return true
  else
    return false
  end
end

#Returns the letter of the winner if there is a winner
def winner
  #This shcekc to see if there is a winner and if so it returns who that winner is
  if won?
    winning_combo = won?
    @board[winning_combo[0]]
  else
    return nil
  end
end

#this is the overall method to play a game of tic tac toe
def play
  until over?
    turn
  end
#when it exits this loop the game will be over
  winning_player=[]
  if draw?
    puts "Cat's Game!"
  else
    winning_player = winner
    puts "Congratulations #{winning_player}!"
  end
end



end
