require_relative "../models/employee"
require_relative "../views/employee_view"

class SessionsController
  def initialize(employee_repo)
    @employee_repo = employee_repo
    @view = EmployeeView.new
  end

  def login
    username = @view.ask_for_stuff("username")
    password = @view.ask_for_stuff("password")
    employee = @employee_repo.find_by_username(username)
    if employee && employee.password == password
      employee
    else
      @view.wrong_password
      login
    end
  end
end
