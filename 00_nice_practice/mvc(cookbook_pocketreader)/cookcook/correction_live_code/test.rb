require_relative 'lib/recipe.rb'
require_relative 'lib/repository.rb'
require_relative 'lib/controller.rb'

cookie = Recipe.new('cookie', 'super cookie')

repo = Repository.new('lib/recipes.csv')

controller = Controller.new(repo)
controller.list

