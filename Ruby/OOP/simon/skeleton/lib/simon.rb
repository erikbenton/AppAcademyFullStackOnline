class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end
  
  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end
  
  def show_sequence
    add_random_color
    system("clear")
    @seq.each do |color|
      puts color.capitalize
      sleep(1)
      system("clear")
      sleep(0.1)
    end
  end

  def require_sequence
    puts "Type the colors in order, pressing enter after each step"
    @seq.each do |color|
      guess = gets.chomp.downcase
      if guess != color
        @game_over = true
        return
      end
    end
    system("clear")
  end

  def add_random_color
    seq.push(COLORS[rand(COLORS.length)])
  end

  def round_success_message
    puts "Yay, now for the next round!"
    sleep(1)
  end

  def game_over_message
    puts "Game over =("
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME

  game = Simon.new
  game.play

end
