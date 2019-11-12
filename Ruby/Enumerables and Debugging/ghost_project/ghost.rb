require_relative "player"
require "byebug"
class Ghost

  attr_reader :dictionary, :fragment, :current_player, :previous_player

  def self.read_in_dictionary
    file = File.open("dictionary.txt")
    file_data = file.readlines.map { |word| word.chomp.downcase }
    file.close
    file_hash = Hash.new(false)
    file_data.each { |ele| file_hash[ele] = true }
    file_hash
  end

  def initialize(name_1, name_2)
    @player_1 = Player.new(name_1)
    @player_2 = Player.new(name_2)
    @current_player = @player_1
    @previous_player = @player_2
    @fragment = ""
    @dictionary = Ghost.read_in_dictionary
  end

  def play_round
    is_round_over = false
    until is_round_over
      take_turn(@current_player)
      is_round_over = self.round_over?
      if !is_round_over
        self.next_player! 
        self.print_fragment
      end
    end
    puts "Round Over!"
    self.print_fragment
    @current_player.losses += 1
    self.print_score
    self.reset_game
  end

  def print_score
    puts "#{@player_1.name}'s score: #{@player_1.score}"
    puts "#{@player_2.name}'s score: #{@player_2.score}"
  end

  def reset_game
    @player_1.reset_chances
    @player_2.reset_chances
    self.reset_fragment
    self.next_player!
  end

  def reset_fragment
    @fragment = ""
  end

  def take_turn(player)
    guess = player.get_guess
    while !self.valid_play?(guess)
      return false if @current_player.chances <= 0
      self.alert_invalid_guess
      @current_player.chances -= 1
      guess = player.get_guess
    end
    @current_player.reset_chances
    @fragment += guess
    return true
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def alert_invalid_guess
    message = "\n#{@current_player.name}! That was invalid, "
    message += "you have #{@current_player.chances} left"
    puts message
  end

  def valid_play?(char)
    if self.dictionary.any? do |k,v|
        k[0..self.fragment.length].include?(self.fragment + char)
      end
      return true
    end
    false
  end

  def round_over?
    if self.dictionary.key?(self.fragment) or @current_player.chances <= 1
      true
    else
      false
    end
  end

  def game_over?
    return true if @player_1.losses >= 5 or @player_2.losses >= 5
    false
  end

  def print_fragment
    puts "Current fragment: #{@fragment}"
  end
end