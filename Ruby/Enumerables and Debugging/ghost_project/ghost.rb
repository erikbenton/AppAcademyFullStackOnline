require_relative "player"
require "byebug"
class Ghost

  attr_reader :dictionary, :fragment, :current_player

  def self.read_in_dictionary
    file = File.open("dictionary.txt")
    file_data = file.readlines.map { |word| word.chomp.downcase }
    file.close
    file_hash = Hash.new(false)
    file_data.each { |ele| file_hash[ele] = true }
    file_hash
  end

  def initialize(names)
    @players = names.map { |name| Player.new(name) }
    @current_player = @players[0]
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
    self.wrap_up_round
  end

  def wrap_up_round
    puts "Round Over!"
    self.print_fragment
    @current_player.losses += 1
    self.eliminate_player
    self.print_score
    self.reset_game
  end

  def print_score
    @players.each do |player|
      puts "#{player.name}'s score: #{player.score}"
    end
  end

  def reset_game
    @players.each { |player| player.reset_chances }
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
    @players.rotate!
    @current_player = @players[0]
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
    return true if @players.length == 1
    false
  end

  def eliminate_players
    if @current_player.losses >= 5
      eliminated = @players.shift
    end
    puts "#{eliminated.name} has been eliminated from the game =("
  end

  def print_fragment
    puts "Current fragment: #{@fragment}"
  end
end