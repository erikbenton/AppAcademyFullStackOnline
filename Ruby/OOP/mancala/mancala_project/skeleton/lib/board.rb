require "byebug"
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @cups = place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    stones = Array.new(14) { [] }
    ((0..5).to_a + (7..12).to_a).each do |idx|
      4.times { stones[idx] << :stone }
    end
    stones
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,12) && start_pos != 6
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    wallet = @cups[start_pos].length
    @cups[start_pos] = []
    current_pos = update_position(start_pos, current_player_name)
    until wallet == 0
      if current_pos == 6
        if current_player_name == @name1
          @cups[current_pos] << :stone
          wallet -= 1
        end
      elsif current_pos == 13
        if current_player_name == @name2
          @cups[current_pos] << :stone
          wallet -= 1
        end
      else
        debugger
        @cups[current_pos] << :stone
        wallet -= 1
        if wallet == 0 && @cups[current_pos].length > 1
          wallet == @cups[current_pos].length
          @cups[current_pos] = []
        end
      end
      current_pos = update_position(start_pos, current_player_name)
    end
  end

  def update_position(pos, current_player_name)
    pos += 1
    if current_player_name == @name1
      if pos == 13
        pos += 1
      end
    else
      if pos == 6
        pos += 1
      end
    end
    return pos % @cups.length
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
