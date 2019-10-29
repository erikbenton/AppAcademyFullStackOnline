require "byebug"

class GuessingGame
  def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(min...max)
    @num_attempts = 0
    @game_over = false
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def game_over=(ans)
    @game_over = ans
  end

  def check_num(num)
    @num_attempts += 1
    self.game_over = (num == @secret_num)
    if game_over?
      puts "you win"
    end
    if num > @secret_num
      puts "too big"
    else
      puts "too small"
    end
  end

  def ask_user
    puts "enter a number"
    num = gets.chomp.to_i
    check_num(num)
  end
end

guess_game = GuessingGame.new(0, 10)
guess_game.check_num(5)
