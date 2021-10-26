require "nokogiri"
require 'open-uri'
require 'csv'
require_relative "recipe"

puts "enter recipe"
user_response = gets.chomp

# url = "https://www.allrecipes.com/search/results/?search=#{user_response}"
#
# def fetching_top_recipes(url)
#   search_array = []
#   file = URI.open(url).read
#   document_html = Nokogiri::HTML(file)
#
#   search_array << document_html.search(".card__title").first(5)
#   search_array << document_html.search(".card__summary").first(5)
#   search_array
# end
# search_array = fetching_top_recipes(url)
# clean_array = search_array[0]+search_array[1]

puts " save recipe ?"
puts "press the index of recipe to save , 6 for exit"
puts "1. #{clean_array[0].text.strip} => #{clean_array[5].text.strip}"
puts "2. #{clean_array[1].text.strip} => #{clean_array[6].text.strip}"
puts "3. #{clean_array[2].text.strip} => #{clean_array[7].text.strip}"
puts "4. #{clean_array[3].text.strip} => #{clean_array[8].text.strip}"
puts "5. #{clean_array[4].text.strip} => #{clean_array[9].text.strip}"
puts "6. Exit"
user_save = gets.chomp.to_i
user_choice = Recipe.new(clean_array[user_save - 1].text.strip, clean_array[user_save +4].text.strip)


csv_path = File.join(__dir__, 'recipes_online.csv')

def load(user_choice, csv_path)
  recipes = []
    CSV.foreach(csv_path) do |row|
      recipes << Recipe.new(row[0], row[1])
    end
    recipes << user_choice
    return recipes
end

db = load(user_choice, csv_path)

def save(db, csv_path)
  CSV.open(csv_path, 'wb') do |csv|
    db.each do |recipe|
      csv << [recipe.name, recipe.description]
    end
  end
end

save(db, csv_path)
puts "sauvegarde effectuée"
