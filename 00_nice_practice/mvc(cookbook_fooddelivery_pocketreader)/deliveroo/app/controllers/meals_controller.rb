require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def add
    name = @view.ask_user_for('name')
    price = @view.ask_user_for('price').to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def list
    @view.display(@meal_repository.all)
  end

  def edit
    list
    meal_id = @view.ask_user_for('index').to_i
    meal = @meal_repository.find(meal_id)
    new_name = @view.ask_user_for('new name')
    new_price = @view.ask_user_for('new price').to_i
    @meal_repository.update(meal, new_name, new_price)
    list
  end
end
