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
    valid = true
    valid &= input.length == 3
    valid &= input[0] >= 0
    valid &= input[1] >= 0
    valid &= (1..9).to_a.include?(input[2])
    valid
  end

  def get_input
    input = gets.chomp
    input = input.split(",").map! { |ele| ele.strip.to_i}
    input
  end
end