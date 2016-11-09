require_relative "game.rb"

puts "1. New Game"
puts "2. Load Game"
puts "3. Delete Game"
choice = gets.chomp
if choice == "1"
  game = Game.new
  game.play

elsif choice == "2"
  puts Dir.entries("../games")
  puts "Which game would you like to load? Just enter the number, or \"c\" to cancel."
  game_number = gets.chomp
  if game_number == "c"
    exit
  end
  stored_state = YAML.load(File.read("../games/game#{game_number}.txt"))
  game = Game.new
  game.load_saved_game(stored_state, game_number)

elsif choice == "3"
  puts Dir.entries("../games")
  puts "Which game would you like to delete? Just enter the number, or \"c\" to cancel."
  game_number = gets.chomp
  if game_number == "c"
    exit
  end
  File.delete("../games/game#{game_number}.txt")
end