require_relative "board.rb"

class Game
  
  def initialize
    define_the_word
    @board = Board.new(@word.length)
    puts @word

  end

  def play
    guess = get_guess
    @board.redraw_board(check_guess(guess), guess, @word.length)
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