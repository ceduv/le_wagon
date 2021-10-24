class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      print_menu
      user_action = gets.chomp.to_i
      print `clear`
      action(user_action)
    end
  end

  private

  def print_menu
    puts "\n\n-------------------"
    puts "1. list meals"
    puts "2. add meal"
    puts "3. list customers"
    puts "4. add customer"
    puts "5. Exit"
    puts "6. Edit a meal"
    puts "-------------------\n\n"
  end

  def action(number)
    case number
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then stop!
    when 6 then @meals_controller.edit
    end
  end

  def stop!
    @running= false
  end
end
