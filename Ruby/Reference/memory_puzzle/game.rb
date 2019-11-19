require_relative "board"
require_relative "card"
require_relative "players"

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

  def reset_guessed_cards
    @first_card.hide
    @second_card.hide
  end

  def play
    while true
      guess = @player.get_guess
      if @board[guess].facing_down?
        @first_card = @board[guess]
        @first_card.reveal
      end
      @board.render
      guess = @player.get_guess
      if @board[guess].facing_down?
        @second_card = @board[guess]
        @second_card.reveal
      end
      @board.render
      self.check_guessed_cards
      if self.end_of_game?
        puts "Congrats!"
        break
      end
    end
  end

  def check_guessed_cards
    if self.different_cards
      self.reset_guessed_cards
    end
  end

  def different_cards
    @first_card != @second_card
  end

  def end_of_game?
    if @board.won?
      return true
    else
      puts "Next round? (y = yes)"
      prompt = gets.chomp
      if prompt != "y"
        return true
      end
    end
    false
  end

  def get_guessed_card(guess)
    
  end
end

length, name = Game.get_game_parameters
game = Game.new(length, name)