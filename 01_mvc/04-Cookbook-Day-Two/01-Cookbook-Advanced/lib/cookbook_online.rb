require 'csv'
require_relative "recipe"
require "nokogiri"
require 'open-uri'

class CookbookOnline
  attr_reader :search_array

  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    @search_array = []
    load
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes = []
    load
    @recipes << recipe
    save
  end

  def remove_recipe(recipe_index)
    @recipes = []
    load
    @recipes.delete_at(recipe_index.to_i - 1)
    save
  end

  def fetching_top_recipes(research)
  search_array = []
  file = URI.open("https://www.allrecipes.com/search/results/?search=#{research}").read
  document_html = Nokogiri::HTML(file)
  search_array << document_html.search(".card__title").first(5)
  search_array << document_html.search(".card__summary").first(5)
  @search_array = search_array[0]+search_array[1]
  end

  private

  def load
    CSV.foreach(@csv_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save
    CSV.open(@csv_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

end
