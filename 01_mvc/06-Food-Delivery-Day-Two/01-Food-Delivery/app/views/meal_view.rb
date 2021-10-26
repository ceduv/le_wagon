class MealView
  def display_all_meals(array)
    array.each do |row|
      puts "#{row.id} - #{row.name} ===> #{row.price} €"
    end
  end

  def ask_for_name
    puts "Enter the name"
    print ">"
    gets.chomp
  end

  def ask_for_price
    puts "Enter the price"
    print ">"
    gets.chomp
  end
end
