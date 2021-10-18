require 'csv'
require_relative 'recipe'

class Repository
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    load_data_from_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    store_in_csv
  end

  def remove(recipe_index)
    @recipes.delete_at(recipe_index)
    store_in_csv
  end

  private

  def load_data_from_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_path, csv_options) do |row|            # pour chaque ligne de mon csv
      recipe = Recipe.new(row['name'], row['description'])  # j instancie une recette avec en 1 name en 2 la description
      @recipes << recipe                                    # chaque instance est stocké ds mon tableau
    end
  end

  def store_in_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_path, 'wb', csv_options) do |csv|
      csv << ['name', 'description']        # header
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
        # csv << recipe.data_for_csv
      end
    end
  end
end
