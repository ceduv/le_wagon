require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_path)
    @customers = []
    @csv_path = csv_path
    load_csv
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def find(param)
    @customers.find { |customer| param == customer.id }
  end

  private

  def load_csv
    if File.exist?(@csv_path)
      CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
        @customers << Customer.new(id: row[:id].to_i, name: row[:name], address: row[:address])
      end
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_path, "wb", csv_options) do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
