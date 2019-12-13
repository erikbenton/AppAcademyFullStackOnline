require_relative "employee.rb"
class Manager < Employee
  def initialize(name, title, salary, boss)
    @sub_employees = []
    super
  end

  def bonus(multiplier)
    @sub_employees.sum { |employee| employee.salary * multiplier }
  end
  
  def hire(*employees)
    employees.each { |employee| @sub_employees << employee }
    unless boss.nil?
      boss.hire(*employees)
    end
  end

  def fire(employee)
    raise "Not an employee" unless @sub_employees.include?(employee)
    @sub_employees.delete(employee)
    true
  end
end

if __FILE__ == $PROGRAM_NAME

  ned = Manager.new("Ned", "Founder", 1000000, nil)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  shawna = Employee.new("Shawna", "TA", 12000, darren)
  david = Employee.new("David", "TA", 10000, darren)

  ned.hire(darren)
  darren.hire(shawna, david)

  p ned.bonus(5)
  p darren.bonus(4)
  p david.bonus(3)
  p darren.fire(david)
  p darren.fire(ned)
end