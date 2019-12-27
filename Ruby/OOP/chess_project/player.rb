require_relative "display.rb"
class Player
  attr_reader :color, :display
  attr_writer :color, :display
  def initialize(color, display)
    @color = color
    @display = display    
  end
end