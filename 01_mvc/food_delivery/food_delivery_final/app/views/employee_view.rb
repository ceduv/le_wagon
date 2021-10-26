class EmployeeView
  def display(employees)
    employees.each_with_index do |employee, i|
      puts "#{i + 1} | #{employee.username}"
    end
  end
end
