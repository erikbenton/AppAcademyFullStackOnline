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