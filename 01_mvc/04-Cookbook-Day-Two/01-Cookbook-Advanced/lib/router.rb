class Router
  def initialize(controller,online_controller)
    @controller = controller
    @online_controller = online_controller
    @running = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      if action == 4
        display_tasks_online
        action_online = gets.chomp.to_i
        route_action_online(action_online)
      else
        route_action(action)
      end
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    # when 4 then @online_controller.import
    when 5 then stop
    else
      puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Create a new recipe"
    puts "3 - Destroy a recipe"
    puts "4 - Import a online recipe"
    puts "5 - Stop and exit the program"
  end

  def route_action_online(action_online)
    case action_online
    when 1 then @controller.list
    when 2 then @online_controller.import
    when 3 then @online_controller.save
    when 4 then @online_controller.back
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

    def display_tasks_online
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all recipes"
    puts "2 - Import a new recipe from web"
    puts "3 - Save a recipe"
    puts "4 - Exit web research"
  end
end
