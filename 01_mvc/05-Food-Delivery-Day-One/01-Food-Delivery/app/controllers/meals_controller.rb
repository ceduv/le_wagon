require_relative "../models/meal"
require_relative "../views/meal_view"

class MealsController
  def initialize(repository)
    @repository = repository
    @view = MealView.new
  end

  def add
    name = @view.ask_for_name
    price = @view.ask_for_price.to_i
    meal = Meal.new(name: name, price: price)
    @repository.create(meal)
  end

  def list
    meal = @repository.all
    @view.display_all_meals(meal)
  end
end
