require_relative "recipe"

class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe.name} #{recipe.description}"
    end
  end

  def ask_for_stuff(stuff)
    puts "Enter the #{stuff}"
    print ">"
    gets.chomp
  end
end
