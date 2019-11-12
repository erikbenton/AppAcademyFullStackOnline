require_relative "ghost"

puts "Starting a game of 'Ghost'"
puts "Enter player one's name: "
player_1 = gets.chomp
puts "Enter player two's name: "
player_2 = gets.chomp
ghost = Ghost.new(player_1, player_2)

until ghost.game_over? or ghost.current_player.out_of_chances? do
  puts "-------------------------"
  ghost.play_round
end