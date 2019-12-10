require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = place_stones
  end

  def place_stones
    stones = Array.new(14) { [] }
    ((0..5).to_a + (7..12).to_a).each do |idx|
      4.times { stones[idx] << :stone }
    end
    stones
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,12) && start_pos != 6
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
