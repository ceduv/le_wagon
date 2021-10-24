require 'csv'
require_relative "recipe"
# csv_path = "recipes.csv"


class Cookbook
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    load
  end

  def all
    # load csv
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    # save to csv
    save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index.to_i - 1)
    # save to csv
    save
  end

  private

  def load
    CSV.foreach(@csv_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
    # @recipes.each << csv
  end

  def save
    CSV.open(@csv_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
