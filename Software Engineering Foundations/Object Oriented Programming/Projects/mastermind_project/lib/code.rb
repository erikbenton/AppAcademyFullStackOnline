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

  def initialize(pegs)
    raise "invalid code" if !Code.valid_pegs?(pegs)
    @pegs = pegs.map { |peg| peg.upcase }
  end

  def self.random(length)
    new_code = []
    length.times do
      idx = rand(0...POSSIBLE_PEGS.length)
      new_code << POSSIBLE_PEGS.keys[idx]
    end
    Code.new(new_code)
  end

  def self.from_string(code_string)
    Code.new(code_string.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

end
