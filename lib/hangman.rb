require_relative "game.rb"

puts "1. New Game"
puts "2. Load Game"
choice = gets.chomp
if choice == "1"
  game = Game.new
  game.play

elsif choice == "2"
  stored_state = YAML.load(File.read('storage.txt'))
  game = Game.new
  game.load_saved_game(stored_state)
end