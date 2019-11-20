class Player
  def initialize(name)
    @name = name
  end

  def get_input
    puts "Enter a position and value for the board (e.g. 'x, y, val')"
    input = gets.chomp
    input = input.split(",").map! { |ele| ele.strip.to_i}
    input
  end
end