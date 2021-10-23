require_relative 'router'
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

meal_csv_file = File.join(__dir__, 'data/meal_csv.csv')
meal_repository = MealRepository.new(meal_csv_file)
meals_controller = MealsController.new(meal_repository)

customer_csv_file = File.join(__dir__, 'data/customer_csv.csv')
customer_repository = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run
