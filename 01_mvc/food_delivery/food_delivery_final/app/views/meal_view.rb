class MealView
  def display(meals)
    meals.each_with_index do |meal, i|
      puts "#{i + 1} | #{meal.name} - #{meal.price}€"
    end
  end

  def ask_user_for(thing)
    puts "What is the #{thing}?"
    print "> "
    gets.chomp
  end

  def ask_for_index
    puts "What meal do you want to act on?"
    print "> "
    gets.chomp.to_i
  end
end
