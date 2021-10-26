require_relative "view_online"
require_relative "cookbook_online"

class ControllerOnline

  def initialize(cookbook)
    @cookbook = cookbook
    @view = ViewOnline.new
  end

  def import
    research = @view.ask_for_research
    array_of_research = @cookbook.fetching_top_recipes(research)
    save_index = @view.display_research(array_of_research)
    recipe = Recipe.new(array_of_research[save_index - 1].text.strip, array_of_research[save_index +4].text.strip)
    @cookbook.add_recipe(recipe)
  end

end
