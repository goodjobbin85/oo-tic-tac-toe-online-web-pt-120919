require 'pry'

class TicTacToe 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5], 
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]
    
  def initialize 
    @board = Array.new(9, " ")
  end
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end 
  
  def input_to_index(position) 
    position.to_i - 1
  end
  
  def move(position, token="X") 
 #   value = input_to_index(position)
    @board[position] = token
    @board
  end
     
  def position_taken?(value) 
      (@board[value] == "X" || @board[value] == "O")
  end
     
  def valid_move?(position)
      if (position < 0 || position > 8) 
        false 
      elsif position_taken?(position) 
         false 
      else 
        true
      end
  end 
     
  def turn 
   puts "Please place your piece" 
   move = gets.chomp 
   proper_move = input_to_index(move) 
   if valid_move?(proper_move) 
     move(proper_move, current_player) 
     display_board 
   else 
     puts "Please provide a valid move." 
     a_move = gets.chomp
   end
  end 
     
  def turn_count 
    count = 0 
    @board.each do |position| 
      if position == "X" || position == "O"
        count += 1 
      end  
    end 
    count
  end 
     
  def current_player 
    if turn_count % 2 == 0 
      "X" 
    else 
      "O" 
    end
  end 
     
     def won?
       
       WIN_COMBINATIONS.any? do |winner| 
         if position_taken?(winner[0]) && @board[winner[0]] == @board[winner[1]] && @board[winner[1]] == @board[winner[2]]  
           return winner 
         end
       end 
       
     end 
     
     def full? 
       full = true 
       @board.each do |element| 
         if !(element == "X" || element == "O")
           full = false 
         end 
       end 
       full
     end 
     
     def draw? 
       full? && !won? 
         
     end 
     
     def over? 
       won? || draw?
     end 
    
     def winner 
       if won? 
           @board[won?.first] 
       end
     end 
     
     
     def play
        turn until over?
          puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
        end
     end
     

