require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(other_startup)
    self.funding > other_startup.funding
  end

  def hire(name, title)
    if self.valid_title?(title)
      @employees << Employee.new(name, title)
      return
    end
    raise "Not a valid title"
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    if self.valid_title?(employee.title)
      if @salaries[employee.title] <= @funding
        employee.pay(@salaries[employee.title])
        @funding -= @salaries[employee.title]
      else
        raise "Not enough funding"
      end
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee)}
  end

  def average_salary
    sum = @employees.inject { |acc, employee| acc += @salaries[employee.title]}
    sum / @employees.length
  end
end
