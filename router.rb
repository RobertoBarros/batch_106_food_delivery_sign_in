class Router

  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run

    employee = @sessions_controller.sign_in

    loop do
      if employee.manager?
        option = print_manager_options
        case option
        when 1 then @meals_controller.list
        when 2 then @meals_controller.add
        when 3 then @customers_controller.list
        when 4 then @customers_controller.add
        end
      end

      if employee.delivery_guy?
        option = print_delivery_guy_options
        case option
        when 1 then "list orders"
        when 2 then "mark as delivered"
        end
      end



      option = print_options
    end

  end

  def print_manager_options
    puts "Choose an option"
    puts "1. List Meals"
    puts "2. Add Meal"
    puts "3. List Customers"
    puts "4. Add Customers"
    puts "5. List undeliverd orders"
    puts "6. Create new order"
    return gets.chomp.to_i
  end

  def print_delivery_guy_options
    puts "Choose an option"
    puts "1. List my undeliverd orders"
    puts "2. Mark order as delivered"
    return gets.chomp.to_i
  end


end
