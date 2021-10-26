# TODO: implement the router of your app.
class Router
  def initialize(meal_controller, customer_controller, sessions_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run # rubocop:disable Metrics/MethodLength
    puts "Welcome to the Deliveroo APP!"
    puts "           --           "
    curent_user = @sessions_controller.login
    if curent_user.role == "rider"
      while @running
        display_tasks_rider
        action = gets.chomp.to_i
        print `clear`
        route_action_rider(action)
      end
    else
      while @running
        display_tasks_manager
        action = gets.chomp.to_i
        print `clear`
        route_action_manager(action)
      end
    end
  end

  private

  def route_action_rider(action)
    case action
    when 1 then @meal_controller.list
    when 2 then @meal_controller.add
    when 3 then run
    when 4 then stop
    else
      puts "Please press 1, 2 ,3 or 4"
    end
  end

  def route_action_manager(action) # rubocop:disable Metrics/MethodLength
    case action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.list
    when 3 then @customer_controller.add
    when 4 then @customer_controller.list
    when 5 then @meal_controller.add
    when 6 then @meal_controller.add
    when 7 then run
    when 8 then stop
    else
      puts "Please press 1, 2 ,3 ,4 ,5 ,6 ,7 or 8"
    end
  end

  def stop
    @running = false
  end

  def display_tasks_rider
    puts ""
    puts "What do you want to do next?"
    puts "1 - Mark order Delivery"
    puts "2 - List all my undelivered order"
    puts "3 - Logout"
    puts "4 - Stop and exit the program"
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - Add new Meal"
    puts "2 - List all Meals"
    puts "3 - Add new Customer"
    puts "4 - List all Customers"
    puts "5 - Add New Order"
    puts "6 - List all the undelivered orders"
    puts "7 - Logout"
    puts "8 - Stop and exit the program"
  end
end
