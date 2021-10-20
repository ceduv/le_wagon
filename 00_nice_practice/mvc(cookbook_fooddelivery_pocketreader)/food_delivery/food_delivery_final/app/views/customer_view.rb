class CustomerView
  def ask_user_for(stuff)
    puts "What is the #{stuff} of the customer?"
    print "> "
    return gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} | #{customer.name} - #{customer.address}"
    end
  end
end
