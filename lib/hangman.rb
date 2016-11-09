require_relative "game.rb"

puts "1. New Game"
puts "2. Load Game"
choice = gets.chomp
if choice == "1"
  game = Game.new
  game.play

elsif choice == "2"
  puts "Which game would you like to load?"
  game_number = gets.chomp
  stored_state = YAML.load(File.read("game#{game_number}.txt"))
  game = Game.new
  game.load_saved_game(stored_state)
end