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
    sum_salaries = @employees.inject(0) { |acc, employee| acc += @salaries[employee.title]}
    sum_salaries / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each { |k, v| @salaries[k] = v if !@salaries.has_key?(k) }
    other_startup.employees.each { |employee| @employees << employee }
    other_startup.close
  end
end
