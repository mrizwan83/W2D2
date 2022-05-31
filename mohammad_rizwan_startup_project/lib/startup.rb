require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees =[]
    end

    def valid_title?(title)
         @salaries.has_key?(title)
    end

    def >(otherstartup)
        @funding > otherstartup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
            @employees << Employee.new(name, title)
        else 
            raise "title does not exist"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amount = self.salaries[employee.title]
        raise "Not enough funding" if amount > @funding
        employee.pay(amount)
        @funding -= amount
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each {|employee| sum += salaries[employee.title]}
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(otherstartup)
        @funding += otherstartup.funding
        otherstartup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end
        @employees += otherstartup.employees
        otherstartup.close
    end
end
