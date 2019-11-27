require_relative "player"
require_relative "board"
require "yaml"
class Minesweeper
  attr_reader :board, :player

  def self.get_parameters
    system "clear"
    puts "Welcome to a game of Minesweeper!"
    puts "What size of board would you like to play with?"
    puts "Or type 'load' to load your latest saved game =)"
    size = gets.chomp
    if size == "load"
      return if Minesweeper.load_game
    end
    until size and size.to_i > 0
      size = gets.chomp.to_i
    end
    game = Minesweeper.new(size.to_i)
    game.play_turn
  end

  def self.load_game
    game = begin
      YAML.load(File.open(Dir.pwd + "/saved_game.yml"))
    rescue => e
      puts "Could not parse YAML: #{e.message}"
      puts "What size of board would you like to play with?"
      return false
    end
    system "clear"
    puts "Game Loaded"
    game.play_turn
    true
  end

  def initialize(size)
    @board = Board.new(size)
    @player = Player.new
  end

  def play_turn
    board.render
    until board.over?
      pos = nil
      pos = player.prompt
      break if save_game?(pos)
      until pos && board.valid_position?(pos)
        puts "That was outside the range of the board" unless pos == "reveal"
        pos = player.prompt
      end
      break if is_it_bomb?(pos)
      board.render
    end
  end

  def save_game?(pos)
    if pos == "save"
      save_directory = Dir.pwd + "/saved_game.yml"
      File.open(save_directory, "w") { |f| f.write(self.to_yaml) }
      puts "Game has been saved to #{save_directory}"
      return true
    elsif pos == "reveal"
      system "clear"
      board.reveal
    elsif
      system "clear"
    end
    false
  end

  def is_it_bomb?(pos)
    if !board.check_position(pos)
      board.render
      puts "You found a bomb =("
      return true
    end
    false
  end
end

if __FILE__ == $PROGRAM_NAME
  Minesweeper.get_parameters
end