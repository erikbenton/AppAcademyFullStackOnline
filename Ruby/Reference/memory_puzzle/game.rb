require_relative "board"
require_relative "card"
require_relative "players"
require "byebug"
class Game

  def self.get_game_parameters
    puts "Welcome to a game of memory!"
    puts "First, what is your name (enter 'ai' for AI)?"
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
    if player_name.downcase == "ai"
      @player = ComputerPlayer.new(player_name, board_length)
      # debugger
    else
      @player = Player.new(player_name)
    end
    @board = Board.new(board_length)
    @first_card = nil
    @second_card = nil
    @guesses = []
    @board.render
    self.play
  end

  def hide_guessed_cards
    @first_card.hide
    @second_card.hide
    if @player.is_a?(ComputerPlayer)
      @player.receive_unmatched_card(@guesses[0], @first_card)
      @player.receive_unmatched_card(@guesses[1], @second_card)
    end
  end

  def reset_guessed_cards
    @first_card = nil
    @second_card = nil
  end

  def play
    game_over = false
    until game_over
      @board.render
      self.flip_cards
      # debugger
      self.check_guessed_cards
      self.reset_guessed_cards
      game_over = self.end_of_game?
    end
  end

  def check_guessed_cards
    if self.different_cards
      self.hide_guessed_cards
    elsif @player.is_a?(ComputerPlayer)
      @player.receive_matched_cards(@guesses, @first_card)
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
      debugger
      puts "That card is already revealed or off the board, try again"
      guess = @player.get_guess
    end
    guess
  end

  def flip_cards
    @guesses = []
    until @guesses.length == 2
      guess = self.get_guess
      @guesses << guess
      if @guesses.length == 1
        @first_card = @board[guess]
        @first_card.reveal
        # @player.receive_unmatched_card(@guesses[0], @first_card)
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

  def reset_game_round
    if !@player.is_a?(ComputerPlayer)
      puts "Memorize! You got 3 seconds!"
      sleep(3)
      system("clear")
    end
  end

  def end_of_game?
    if @board.won?
      puts "Congrats!"
      return true
    else
      self.reset_game_round
    end
    false
  end
end

length, name = Game.get_game_parameters
game = Game.new(length, name)