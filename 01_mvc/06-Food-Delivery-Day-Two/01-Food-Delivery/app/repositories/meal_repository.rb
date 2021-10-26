require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_path)
    @meals = []
    @csv_path = csv_path
    load_csv
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def all
    @meals
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def find(param)
    @meals.find { |element| param == element.id }
  end

  private

  def load_csv
    if File.exist?(@csv_path)
      CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
        @meals << Meal.new(id: row[:id].to_i, name: row[:name], price: row[:price].to_i)
      end
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_path, "wb", csv_options) do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
