require "byebug"
class Player
  def initialize(name)
    @name = name
  end

  def get_guess
    puts "Enter a position on the board (e.g. - 1,2)"
    guess = gets.chomp
    guess = guess.split(",").map! { |ele| ele.strip.to_i}
    guess
  end
end