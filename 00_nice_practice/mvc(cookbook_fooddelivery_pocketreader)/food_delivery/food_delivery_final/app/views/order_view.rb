class OrderView
  def display(orders)
    orders.each_with_index do |order, i|
      puts "#{i + 1} | We need to deliver #{order.meal.name} to #{order.customer.name} by #{order.employee.username}"
    end
  end

  def ask_for_index
    puts "What is the number?"
    print "> "
    gets.chomp.to_i - 1
  end
end
