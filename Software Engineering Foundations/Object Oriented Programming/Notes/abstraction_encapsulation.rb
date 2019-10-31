# Abstraction
#   Hiding the inner workings of the code from the end user
#   While still retaining the same functionality
class Course
  def initialize(name, teachers, max_students)
    @name = name
    @teachers = teachers
    @max_students = max_students
    @students = []
  end

  def max_students
    @max_students
  end

  def students
    @students
  end

  def enroll(student)
    @students << student if @students.length < @max_students
  end
end

course = Course.new("Object Oriented Programming", ["Ada Lovelace", "Brian Kernigham"], 3)

# Let's enroll a student
if course.students.length < course.max_students
  course.students << "Alice"
end

# VS

course.enroll("Erik")

p course

# Encapsulation
#   Hiding the inner data from the end user
#   While still allowing them to use the information

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
end

grocery_checkout = Queue.new
grocery_checkout.add("bob")
grocery_checkout.add("alice")
grocery_checkout.remove          # => "bob"
grocery_checkout.add("noam")
grocery_checkout.add("donald")
grocery_checkout.remove          # => "alice"
grocery_checkout.remove          # => "noam"
grocery_checkout.remove          # => "donald"

p grocery_checkout

# Leave @line hidden from the user so that can't access it like:
# grocery_checkout.add("bob")
# grocery_checkout.add("alice")
# grocery_checkout.line.unshift("noam")   # noam cut the line!
# grocery_checkout.remove                 # => "noam"