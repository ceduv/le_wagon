class OrderView
  def ask_for_stuff(stuff)
    puts "select the #{stuff}"
    print ">"
    gets.chomp
  end

  def display_all_meals(array)
    array.each_with_index do |row, index|
      puts "#{index + 1} - #{row.name} ===> #{row.price} €"
    end
  end

  def display_all_employees(array)
    array.each_with_index do |row, index|
      puts "#{index + 1} - #{row.username}"
    end
  end

  def display_all_customers(array)
    array.each_with_index do |row, index|
      puts "#{index + 1} - #{row.name} => #{row.address}"
    end
  end
end
