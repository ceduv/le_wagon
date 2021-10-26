require_relative "../models/customer"
require_relative "../views/customer_view"

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomerView.new
  end

  def add
    name = @view.ask_for_name
    address = @view.ask_for_address
    customer = Customer.new(name: name, address: address)
    @repository.create(customer)
  end

  def list
    customer = @repository.all
    @view.display_all_customers(customer)
  end
end
