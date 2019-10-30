require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = rooms
    @rooms.each { |room_name, cap| @rooms[room_name] = Room.new(cap) }
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(person, room)
    if !self.room_exists?(room)
      puts "sorry, room does not exist"
    elsif @rooms[room].add_occupant(person)
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.any? { |k, v| !@rooms[k].full? }
  end

  def list_rooms
    @rooms.each do |k, v|
      puts "#{k}: #{@rooms[k].available_space}"
    end
  end
end