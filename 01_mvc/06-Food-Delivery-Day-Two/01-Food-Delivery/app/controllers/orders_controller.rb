require_relative "../models/order"
require_relative "../views/order_view"
require 'pry-byebug'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrderView.new
  end

  def add # rubocop:disable Metrics/MethodLength
    @view.display_all_meals(@meal_repository.all)
    meal_choice = @view.ask_for_stuff("meal").to_i - 1
    meal = @meal_repository.all[meal_choice]

    @view.display_all_employees(@employee_repository.all_riders)
    employee_choice = @view.ask_for_stuff("employee").to_i - 1
    # binding.pry
    employee = @employee_repository.all_riders[employee_choice]

    @view.display_all_customers(@customer_repository.all)
    customer_choice = @view.ask_for_stuff("customer").to_i - 1
    customer = @customer_repository.all[customer_choice]

    @order_repository.create(Order.new(meal: meal, customer: customer, employee: employee))
  end
end
