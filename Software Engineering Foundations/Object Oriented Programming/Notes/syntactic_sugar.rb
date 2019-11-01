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