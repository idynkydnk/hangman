require_relative "board.rb"
require "yaml"

class Game
  
  def initialize
    define_the_word
    @board = Board.new(@word.length)
  end

  def play
    loop do
      @board.draw_board
      guess = get_guess
      if guess == "1"
        save_game_state
      end
      @board.update_state(check_guess(guess), guess, @word.length)
      if @board.winner?
        puts "The word was " + @word
        puts "We have a winner!"
        exit
      end
      if @board.loser?
        puts "\nYou're out of turns! The word was \"" + @word + "\"\n\n\n\n"
        exit
      end
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
    puts "Which letter do you guess?\nEnter \"1\" to save and exit\n\n"
    guess = gets.chomp
    guess = guess.downcase
  end

  def check_guess guess
    correct_guesses = (0 ... @word.length).find_all { |i| @word[i,1] == guess }  
  end

  def save_game_state
    puts "saving the game state..."
    File.open('storage.txt', 'w') {|f| f.write(YAML.dump(@board)) }
    exit
    #@board = YAML.load(File.read('storage.txt'))
  end

  def load_saved_game game_state
    puts "should load the game here"
    @board = game_state
    play
  end







end