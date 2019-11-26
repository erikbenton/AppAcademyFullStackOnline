class Player
  def initialize(name="Erik")
    @name = name
  end

  def valid_pos?(pos)
    return true if pos == "reveal"
    valid = true
    return false unless pos.is_a?(Array)
    return true if pos.length == 2
    if pos.length == 3
      return pos[-1].downcase == "f"
    end
    false
  end

  def parse_pos(pos)
    return pos if pos == "reveal"
    pos.split(",").map { |idx| ("0".."999").to_a.include?(idx) ? idx.to_i : idx }
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