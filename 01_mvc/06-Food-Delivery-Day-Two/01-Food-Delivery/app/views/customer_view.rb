class CustomerView
  def display_all_customers(array)
    array.each do |row|
      puts "#{row.id} - #{row.name} ===> #{row.address}"
    end
  end

  def ask_for_name
    puts "Enter the name"
    print ">"
    gets.chomp
  end

  def ask_for_address
    puts "Enter the address"
    print ">"
    gets.chomp
  end
end
