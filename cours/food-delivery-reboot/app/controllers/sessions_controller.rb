require_relative '../views/session_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def login
    # demander le username
    username = @view.ask_user_for(:username)
    # demander le password
    password = @view.ask_user_for(:password)
    # trouver l'utilisateur si il existe
    employee = @employee_repository.find_by_username(username)
    # comparer le mot de passe
    if employee && employee.password == password
      # on est logged in
      return employee
    else
      @view.wrong_credentials
      login
    end
  end
end
