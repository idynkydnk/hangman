require_relative "board.rb"

class Game
  
  def initialize
    define_the_word
    @board = Board.new(@word.length)
  end

  def play
    loop do
      guess = get_guess
      @board.update_state(check_guess(guess), guess, @word.length)
      if @board.winner?
        puts "We have a winner!"
        quit
      end
      @board.draw_board
    end
  end

  def define_the_word
    dictionary = File.open("../dictionary.txt")

    loop do
      possible_word = dictionary.readlines.sample.chomp   
      if possible_word.length > 4 && possible_word.length < 13
        @word = possible_word.downcase
        dictionary.close
        return
      end
      dictionary.pos = 0
    end
  end

  def get_guess
    puts "Which letter do you guess? "
    guess = gets.chomp
    guess = guess.downcase
  end

  def check_guess guess
    correct_guesses = (0 ... @word.length).find_all { |i| @word[i,1] == guess }  
  end





end