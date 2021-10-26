class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      # se log in
      @employee = @sessions_controller.login
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
    puts "6. Add an order"
    puts "7. List undelivered orders"
    puts "8. Logout"
    puts "9. Exit"
    puts "-------------------\n\n"
  end

  def manager_action(number)
    case number
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then @orders_controller.add
    when 7 then @orders_controller.list_undelivered_orders
    when 8 then logout!
    when 9 then stop!
    end
  end

  def print_rider_menu
    puts "\n\n-------------------"
    puts "1. list my undelivered orders"
    puts "2. mark an order as delivered"
    puts "-------------------\n\n"
  end

  def rider_action(number)
    case number
    when 1 then @orders_controller.mark_as_delivered(@employee)
    when 2 then @meals_controller.list_my_orders(@employee)
    end
  end

  def stop!
    logout!
    @running= false
  end

  def logout!
    @employee = nil
  end
end
