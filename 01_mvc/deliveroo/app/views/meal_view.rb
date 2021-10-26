class MealView
  def ask_user_for(thing)
    puts "What is the #{thing} of the meal?"
    print "> "
    return gets.chomp
  end

  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} | #{meal.name} - #{meal.price}€"
    end
  end
end
