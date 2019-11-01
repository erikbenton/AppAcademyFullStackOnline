class Person
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def ==(other_person)
    self.last_name == other_person.last_name
  end

  def >(other_person)
    self.age > other_person.age
  end
end

person_1 = Person.new("Jane", "Doe", 20)
person_2 = Person.new("John", "Doe", 18)
person_3 = Person.new("John", "Wayne", 18)
p "Is Jane equal to John Doe? #{person_1 == person_2}"
p "Is Jane equal to John Wayne? #{person_1 == person_3}"
p "Is Jane older than John Doe? #{person_1 > person_2}"
p "Is John Doe older than John Wayne? #{person_2 > person_3}"

class Queue
  def initialize
    @line = []
  end

  def add(ele)
    @line << ele
    nil
  end

  def remove
    @line.shift
  end

  def [](idx)
    @line[idx]
  end

  def []=(idx, val)
    @line[idx] = val
  end
end

checkout = Queue.new
checkout.add("Alan")
checkout.add("Alonzo")
p checkout[0]
p checkout[1]
checkout[1] = "Brian"
p checkout[1]