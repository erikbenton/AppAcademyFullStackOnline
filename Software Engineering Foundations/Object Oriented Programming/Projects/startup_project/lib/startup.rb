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
    raise "not a valid title" if !self.valid_title?(title)
    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    return if !self.valid_title?(employee.title)
    money = @salaries[employee.title]
    raise "not enough funding" if money > @funding
    employee.pay(money)
    @funding -= money
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee)}
  end

  def average_salary
    sum_salaries = @employees.inject(0) do |acc, employee|
      acc += @salaries[employee.title]
    end
    sum_salaries / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other_startup)
    @funding += other_startup.funding
    other_startup.salaries.each do |k, v|
      @salaries[k] = v if !@salaries.has_key?(k)
    end
    @employees += other_startup.employees
    other_startup.close
  end
end
