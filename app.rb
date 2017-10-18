require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'

meal_repository = MealRepository.new('data/meals.csv')
meals_controller = MealsController.new(meal_repository)


require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'

customer_repository = CustomerRepository.new('data/customers.csv')
customers_controller = CustomersController.new(customer_repository)

require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
employee_repository = EmployeeRepository.new('data/employees.csv')
sessions_controller = SessionsController.new(employee_repository)

require_relative 'router'
router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run