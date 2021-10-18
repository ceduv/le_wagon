require "open-uri"
require "nokogiri"
require_relative "recipe"

class ScrapeAllrecipesService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html = URI.open("https://www.allrecipes.com/search/results/?search=#{@ingredient}").read
    # 1. Parse HTML
    doc = Nokogiri::HTML(html, nil, "utf-8")
    # 2. For the first five results
    results = []
    doc.search(".card__recipe").first(5).each do |element|
      # on vien iterer sur les 5 premieres cards
      # 3. Create recipe and store it in results
      name = element.search(".card__imageContainer a").first.attribute("title").value.strip
      # ds le a(href) on vien chercher l attribut title
      description = element.search(".card__detailsContainer .card__summary").first.text.strip
      # on vien cibler 2 div=class .card__detailsContainer .card__summary
      rating_element = element.search(".card__detailsContainer .review-star-text").first
      # on vien cherche la premiere star active ?
      rating = rating_element ? rating_element.text.strip.match(/\d\.?\d*/)[0] : nil
      # si on trouve l element , on extrait la note
      recipe_url = element.search(".card__imageContainer a").first.attribute("href").value.strip
      # on recup le lien par l attribut href
      recipe_html = URI.open(recipe_url).read
      recipe_doc = Nokogiri::HTML(recipe_html, nil, "utf-8")
      # on ouvre le lien en recipe_html
      prep_element = recipe_doc.search(".recipe-meta-item").find do |element|
        # on recup le temp de prepa
        element.text.strip.match?(/prep/i)
      end
      prep_time = prep_element ? prep_element.text.strip.match(/prep:\s+(\w* \w*)/i)[1] : nil
      # on extrait la donné de preptime
      results << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
      # stock nouvelle objet ds result
    end
    results
  end
end
