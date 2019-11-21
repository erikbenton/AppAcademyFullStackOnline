require "byebug"
class Player
  def initialize(name)
    @name = name
  end

  def get_guess
    puts "Enter a position and value for the board (e.g. 'x, y, val')"
    input = self.get_input
    until self.valid_input?(input)
      puts "Sorry that was invalid, try again ('x, y, val')"
      input = self.get_input
    end
    input
  end

  def valid_input?(input)
    acceptable_vals = ("1".."9").to_a + ["X"]
    valid = true
    valid &= input.length == 3
    valid &= input[0] >= 0
    valid &= input[1] >= 0
    valid &= acceptable_vals.include?(input[2])
    valid
  end

  def get_input
    input = gets.chomp
    debugger
    input = input.split(",").map { |ele| ele.strip}
    input[0] = input[0].to_i
    input[1] = input[1].to_i
    input
  end
end

if __FILE__ == $PROGRAM_NAME
  player = Player.new("Erik")
  player.get_guess
end