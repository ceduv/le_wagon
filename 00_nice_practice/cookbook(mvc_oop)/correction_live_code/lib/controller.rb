require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(repository)
    @repo = repository
    @view = View.new
  end

  def list
    # récupérer les recettes (repo)
    recipes = @repo.all
    # afficher les recettes (view)
    @view.display_recipes(recipes)
  end

  def create
    # demander le nom de la recette (view)
    name = @view.ask_for_name
    # demander la description de la recette (view)
    description = @view.ask_for_description
    # créer une nouvelle recette (avec le nom et la description)
    new_recipe = Recipe.new(name, description)
    # donner la recette au repo (repo)
    @repo.add(new_recipe)
  end

  def destroy
    list
    # demander l'index de la recipe (view)
    index = @view.ask_for_index
    # demander au repo de destroy la recette au bon index
    @repo.remove(index)
  end
end
