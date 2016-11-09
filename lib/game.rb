require_relative "board.rb"
require "yaml"

class Game
  
  def initialize
    @board = Board.new
  end

  def play
    loop do
      @board.draw_board
      guess = get_guess
      if guess == "1"
        save_game_state
      end
      @board.update_state(check_guess(guess), guess)
      if @board.winner?
        puts "The word was " + @board.word
        puts "We have a winner!\n\n\n"
        if File.exist?("../games/game#{@board.game_number}.txt")
          File.delete("../games/game#{@board.game_number}.txt")
        end
        exit
      end
      if @board.loser?
        puts "\nYou're out of turns! The word was \"" + @board.word + "\"\n\n\n\n"
        if File.exist?("../games/game#{@board.game_number}.txt")
          File.delete("../games/game#{@board.game_number}.txt")
        end
        exit
      end
    end
  end

  def get_guess
    puts "Which letter do you guess?\nEnter \"1\" to save and exit\n\n"
    guess = gets.chomp
    guess = guess.downcase
  end

  def check_guess guess
    correct_guesses = (0 ... @board.word.length).find_all { |i| @board.word[i,1] == guess }  
  end

  def save_game_state
    puts "saving the game..."
    10.times do |i|
      if !File.exist?("../games/game#{i}.txt")
        filename = "../games/game#{i}.txt"
        File.open(filename, 'w') {|f| f.write(YAML.dump(@board)) }
        exit
      end
    end
    puts "Stop saving so many games! Not saving any more until you delete some."
    exit
  end

  def load_saved_game game_state, game_number
    @board = game_state
    @board.game_number = game_number
    play
  end

end