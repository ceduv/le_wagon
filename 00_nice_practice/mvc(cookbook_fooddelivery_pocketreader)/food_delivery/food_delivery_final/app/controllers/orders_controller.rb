require_relative '../views/order_view'
require_relative '../views/meal_view'
require_relative '../views/customer_view'
require_relative '../views/employee_view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @order_view = OrderView.new
    @meal_view = MealView.new
    @customer_view = CustomerView.new
    @employee_view = EmployeeView.new
  end


  def add
    meal = find_meal
    @customer_view.display(@customer_repository.all)
    customer_index = @order_view.ask_for_index
    customer = @customer_repository.all[customer_index]

    @employee_view.display(@employee_repository.all_riders)
    employee_index = @order_view.ask_for_index
    employee = @employee_repository.all_riders[employee_index]

    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee,
    )

    @order_repository.create(order)
  end

  def list_undelivered_orders
    @order_view.display(@order_repository.undelivered_orders)
  end


  def list_my_orders(employee)
    @order_view.display(undelivered_orders_for(employee))
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    order_index = @order_view.ask_for_index
    order_to_mark = undelivered_orders_for(employee)[order_index]
    @order_repository.mark_as_delivered(order_to_mark)
  end

  private

  def undelivered_orders_for(employee)
    @order_repository.undelivered_orders.select do |order|
      order.employee.id == employee.id
    end
  end

  def find_meal
    @meal_view.display(@meal_repository.all)
    meal_index = @order_view.ask_for_index
    return @meal_repository.all[meal_index]
  end
end
