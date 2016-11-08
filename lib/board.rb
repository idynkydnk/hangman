class Board
  def initialize word_length
    @chosen_letters = []
    @misses = 6 
    draw_new_board(word_length)
    
  end

  def draw_new_board word_length
    #puts "Chosen letters: " + @chosen_letters.join(", ")

    word_length.times do
      print "_ "
    end
    puts
    puts "You have " + @misses.to_s + " chances left."
  end

  def redraw_board guesses, guess, word_length
    word_length.times do |i|
      if i == 
    puts guesses
    puts guess
  end





end