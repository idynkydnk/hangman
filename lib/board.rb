class Board
  attr_accessor :word
  def initialize 
    @chosen_letters = []
    @chances = 6 
    @game_state = ""
    @word = define_the_word
    set_game_state
    
  end

  def draw_board
    #system("clear")
    puts
    puts
    puts
    puts "Chosen letters: " + @chosen_letters.join(", ")
    puts "You have " + @chances.to_s + " chances left."
    puts 
    puts @game_state   
    puts
  end
  
  def define_the_word
    dictionary = File.open("../dictionary.txt")

    loop do
      possible_word = dictionary.readlines.sample.chomp   
      if possible_word.length > 4 && possible_word.length < 13
        word = possible_word.downcase
        dictionary.close
        return word
      end
      dictionary.pos = 0
    end
  end

  def update_state guesses, guess
    x = 0
    @chosen_letters << guess
    if guesses.empty?
      @chances -= 1
    end
    @word.length.times do |i|
      if i == guesses[x]
        @game_state[i*2] = guess
        x += 1
      end
    end
  end

  def set_game_state
    @word.length.times do
      @game_state << "_ "
    end
  end

  def winner?
    (@game_state.length / 2).times do |i|
      if @game_state[i*2] == "_"
        return false
      end
    end
    return true
  end

  def loser?
    if @chances == 0
      return true
    else false
    end
  end




end