require_relative "board"
require_relative "card"
require_relative "players"
require "byebug"
class Game

  def self.get_game_parameters
    puts "Welcome to a game of memory!"
    puts "First, what is your name?"
    name = gets.chomp
    puts "Second, how big of a board do you want to play on? (even numbers >= 2 only)"
    size = gets.chomp.to_i
    until size > 1 and size.even?
      puts "Sorry, that was invalid..."
      puts "How big of a board do you want to play on? (even numbers >= 2 only)"
      size = gets.chomp.to_i
    end
    return size, name
  end

  def initialize(board_length, player_name)
    @player = Player.new(player_name)
    @board = Board.new(board_length)
    @first_card = nil
    @second_card = nil
    @board.render
    self.play
  end

  def hide_guessed_cards
    @first_card.hide
    @second_card.hide
  end

  def reset_guessed_cards
    @first_card = nil
    @second_card = nil
  end

  def play
    game_over = false
    until game_over
      cards = [@first_card, @second_card]
      self.flip_cards
      self.check_guessed_cards
      self.reset_guessed_cards
      game_over = self.end_of_game?
    end
  end

  def check_guessed_cards
    if self.different_cards
      self.hide_guessed_cards
    end
    self.reset_guessed_cards
  end

  def valid_guess?(guess)
    return false if !guess.all? { |num| num.between?(0, @board.length - 1) }
    return @board[guess].facing_down?
  end

  def get_guess
    guess = @player.get_guess
    until self.valid_guess?(guess)
      puts "That card is already revealed or off the board, try again"
      guess = @player.get_guess
    end
    guess
  end

  def flip_cards
    guesses = []
    until guesses.length == 2
      guess = self.get_guess
      guesses << guess
      if guesses.length == 1
        @first_card = @board[guess]
        @first_card.reveal
      else
        @second_card = @board[guess]
        @second_card.reveal
      end
      @board.render
    end
  end

  def different_cards
    @first_card != @second_card
  end

  def end_of_game?
    if @board.won?
      puts "Congrats!"
      return true
    else
      puts "Next round? (y = yes)"
      prompt = gets.chomp
      if prompt != "y"
        puts "=("
        return true
      end
    end
    false
  end
end

length, name = Game.get_game_parameters
game = Game.new(length, name)