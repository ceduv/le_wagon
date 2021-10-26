# TODO: implement the router of your app.
class Router
  def initialize(meal_controller, customer_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @running = true
  end

  def run
    puts "Welcome to the Deliveroo APP!"
    puts "           --           "
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @meal_controller.list
    when 2 then @meal_controller.add
    when 3 then @meal_controller.find
    when 4 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meal"
    puts "3 - Find a meal"
    puts "4 - Stop and exit the program"
  end
end
