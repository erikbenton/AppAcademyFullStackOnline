class Player

  attr_reader :name
  attr_accessor :chances, :losses

  def initialize(name)
    @name = name
    @chances = 3
    @losses = 0
  end

  def get_guess
    alpha = ("a".."z").to_a
    puts "#{@name}'s turn"
    puts "Enter a letter to add to the end of the current fragment"
    guess = gets.chomp
    while guess.empty? or !alpha.include?(guess[0].downcase)
      puts "Invalid entry, try again"
      guess = gets.chomp
    end
    guess.downcase
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