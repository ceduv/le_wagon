require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/sessions_controller"
require_relative "router"
# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

csv_file_meal = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(csv_file_meal)
meal_controller = MealsController.new(meal_repo)

csv_file_customer = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(csv_file_customer)
customer_controller = CustomersController.new(customer_repo)

csv_file_employee = File.join(__dir__, 'data/employees.csv')
employee_repo = EmployeeRepository.new(csv_file_employee)
employee_controller = SessionsController.new(employee_repo)
p employee_repo.all

router = Router.new(meal_controller, customer_controller, employee_controller)

# Start the app
router.run
