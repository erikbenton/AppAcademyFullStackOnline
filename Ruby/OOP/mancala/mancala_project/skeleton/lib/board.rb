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
    current_pos = start_pos
    until wallet == 0
      current_pos = update_position(current_pos, current_player_name)
      if valid_cup?(current_pos, current_player_name)
        @cups[current_pos].push(:stone)
        wallet -= 1
      end
    end
    render
    next_turn(current_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup?(ending_cup_idx)
      return :switch
    end
    if players_cup?(ending_cup_idx, player_name)
      return :prompt
    end
    return ending_cup_idx
  end

  def valid_cup?(cup_pos, player_name)
    return false if cup_pos == 6 && player_name != @name1
    return false if cup_pos == 13 && player_name != @name2
    true
  end

  def players_cup?(pos, player_name)
    return true if pos == 6 && player_name == @name1
    return true if pos == 13 && player_name == @name2
    false
  end

  def ending_cup?(pos)
    return true if @cups[pos].length == 1 && pos != 6 && pos != 13
    false
  end

  def update_position(pos, current_player_name)
    if current_player_name == @name1
      pos += 1 if pos == 13
    else
      pos += 1 if pos == 6
    end
    return (pos + 1) % @cups.length
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    bottom_cups = []
    top_cups = []
    (0..5).to_a.each { |idx| bottom_cups << @cups[idx] }
    (7..12).to_a.each { |idx| top_cups << @cups[idx] }
    return true if bottom_cups.all? { |cup| cup.empty? }
    return true if top_cups.all? { |cup| cup.empty? }
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    champ = @cups[6].length > @cups[13].length ? @name1 : @name2
    champ
  end
end
