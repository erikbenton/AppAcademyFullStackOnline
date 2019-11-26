class Player
  def initialize(name)
    @name = name
  end

  def valid_pos?(pos)
    pos.is_a?(Array) && pos.length == 2
  end

  def parse_pos(pos)
    pos.split(",").map { |idx| idx.to_i }
  end

  def prompt
    pos = nil
    until pos && valid_pos?(pos)
      puts "Please enter an a position on the board (e.g. '3,4')"
      pos_str = gets.chomp
      begin
        pos = parse_pos(pos_str)
      rescue => exception
        puts "That was an invalid input..."
        pos = nil
      end
    end
    pos
  end
end