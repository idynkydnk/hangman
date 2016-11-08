class Game
  
  def initialize
    define_the_word
  end

  def play
    puts @word
  end

  def define_the_word
    dictionary = File.open("../dictionary.txt")

    loop do
      possible_word = dictionary.readlines.sample     
      if possible_word.length > 4 && possible_word.length < 13
        @word = possible_word
        dictionary.close
        return
      end
      dictionary.pos = 0
    end
  end






end