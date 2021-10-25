class Router
  def initialize(meals_controller, customers_controller, employee_repository)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employee_repository = employee_repository
    @running = true
  end

  def run
    while @running
      # se log in
      @employee = @employee_repository.login
      while @employee
        if @employee.manager?
          print_manager_menu
          user_action = gets.chomp.to_i
          print `clear`
          manager_action(user_action)
        else
          print_rider_menu
          user_action = gets.chomp.to_i
          print `clear`
          rider_action(user_action)
        end
      end
    end
  end

  private

  def print_manager_menu
    puts "\n\n-------------------"
    puts "1. list meals"
    puts "2. add meal"
    puts "3. Edit a meal"
    puts "4. list customers"
    puts "5. add customer"
    puts "6. Exit"
    puts "-------------------\n\n"
  end

  def manager_action(number)
    case number
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then logout!
    when 7 then stop!
    end
  end

  def print_rider_menu
    puts "RIDER MENU"
    # un vrai menu
  end

  def rider_action(number)
    # de vraies actions
  end

  def stop!
    logout!
    @running= false
  end

  def logout!
    @employee = nil
  end
end
