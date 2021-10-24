require_relative "view"
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    recipe = Recipe.new(@view.ask_for_stuff("name"), @view.ask_for_stuff("description"))
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.display(@cookbook.all)
    index = @view.ask_for_stuff("index of the recipe to destroy")
    @cookbook.remove_recipe(index)
  end
end
