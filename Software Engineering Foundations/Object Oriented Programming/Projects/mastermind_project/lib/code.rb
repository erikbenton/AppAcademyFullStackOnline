class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs
  
  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    new_code = Array.new(length) do
      POSSIBLE_PEGS.keys[rand(0...POSSIBLE_PEGS.length)]
    end
    Code.new(new_code)
  end

  def self.from_string(code_string)
    Code.new(code_string.split(""))
  end
  
  def initialize(pegs)
    raise "invalid code" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    (0...code.length).to_a.count { |idx| code[idx] == self[idx]}
  end

  def num_near_matches(code)
    count = code.pegs.count { |char| @pegs.include?(char) }
    count - self.num_exact_matches(code)
  end

  def ==(code)
    @pegs == code.pegs
  end

end
