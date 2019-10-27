class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def slogan
    @slogan
  end

  def slogan=(new_slogan)
    @slogan = new_slogan
  end

  def student_capacity
    @student_capacity
  end

  def student_capacity=(new_capacity)
    @student_capacity = new_capacity
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def grades
    @grades
  end

  def hire(teacher)
    teachers << teacher
  end

  def enroll(student)
    if students.length < student_capacity
      students << student
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    students.include?(student)
  end

  def student_to_teacher_ratio
    students.length / teachers.length
  end

  def add_grade(student, grade)
    if students.include?(student)
      grades[student] << grade
      return true
    else
      return false
    end
  end

  def num_grades(student)
    grades[student].length
  end

  def average_grade(student)
    return nil if !students.include?(student) || grades[student].length == 0
    grades[student].sum / grades[student].length
  end

end
