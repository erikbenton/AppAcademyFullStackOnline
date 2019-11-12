class Player

  attr_reader :name
  attr_accessor :chances, :losses

  def initialize(name)
    @name = name
    @chances = 3
    @losses = 0
  end

  def get_guess
    puts "#{@name}'s turn"
    puts "Enter a letter to add to the end of the current fragment"
    guess = gets.chomp[0].downcase
  end

  def reset_chances
    self.chances = 3
  end

  def out_of_chances?
    return true if self.chances == 0
    false
  end

  def score
    return "GHOST"[0...@losses]
  end
end