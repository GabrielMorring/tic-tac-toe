require_relative "lib/game"

loop do
  puts "\nPlay game? (y/n)"
  break if gets.chomp == "n"

  game = Game.new
  game.play
end
