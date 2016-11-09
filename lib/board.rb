class Board
  def initialize word_length
    @chosen_letters = []
    @chances = 6 
    @game_state = ""
    set_game_state(word_length)
    draw_board
    
  end

  def draw_board
    puts
    puts
    puts
    puts "Chosen letters: " + @chosen_letters.join(", ")
    puts "You have " + @chances.to_s + " chances left."
    puts 
    puts @game_state   
    puts
  end

  def update_state guesses, guess, word_length
    x = 0
    @chosen_letters << guess
    if guesses.empty?
      @chances -= 1
      if @chances == 0
        puts "You lost!"
        exit
      end
    end
    word_length.times do |i|
      if i == guesses[x]
        @game_state[i*2] = guess
        x += 1
      end
    end
  end

  def set_game_state word_length
    word_length.times do
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





end