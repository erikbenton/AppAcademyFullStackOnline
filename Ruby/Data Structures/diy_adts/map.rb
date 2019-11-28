class Map
  def initialize
    @map = []
  end

  def set(key, val)
    @map.each do |pair|
      if pair[0] == key
        pair[1] = val
        return
      end
    end
    @map.push([key, val])
  end
  
  def get(key)
    return if @map.empty?
    @map.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    nil
  end

  def delete(key)
    val = get(key)
    return unless val
    @map.delete([key, val])
  end

  def show
    if @map.empty?
      puts "empty"
      return
    end
    @map.each { |entry| puts "#{entry[0]} => #{entry[1]} "}
  end
end

if __FILE__ == $PROGRAM_NAME
  my_map = Map.new
  my_map.show
  my_map.set("erik", 29)
  my_map.set("Satu", 27)
  my_map.show
  satu_age = my_map.get("Satu")
  p satu_age
  my_map.delete("erik")
  my_map.show
  my_map.set("Erik", 28)
  my_map.show
  my_map.set("Erik", 24)
  my_map.show
end