require_relative "ghost"
players = []
puts "Starting a game of 'Ghost'"
puts "Enter a player's name: "
players << gets.chomp
until players[-1].downcase == "no" or players.length > 100
  puts "Enter another player's name: "
  puts "For no other players, enter 'no'"
  players << gets.chomp
end
ghost = Ghost.new(players[0...-1])

until ghost.game_over? or ghost.current_player.out_of_chances? do
  puts "-------------------------"
  ghost.play_round
end