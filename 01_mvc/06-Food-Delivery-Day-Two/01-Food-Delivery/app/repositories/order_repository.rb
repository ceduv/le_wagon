require "csv"
require_relative "../models/order"
require 'pry-byebug'

class OrderRepository
  def initialize(csv_file, meal_repo, customer_repo, employee_repo)
    @csv_file = csv_file
    @meal_repository = meal_repo
    @customer_repository = customer_repo
    @employee_repository = employee_repo
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    @orders << order ###
    save_csv
  end

  def undelivered_orders
    @orders.select { |order| order.delivered == false }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:delivered] = row[:delivered] == "true"
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << %w[id meal_id employee_id customer_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.employee.id, order.customer.id, order.delivered]
      end
    end
  end
end
