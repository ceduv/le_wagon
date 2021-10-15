class Recipe
    def initialize(attributes = {})
      @name = attributes[:name]
      @description = attributes[:description]
      @id = attributes[:id]
    end
  end

  Recipe.new({name: "Chocolate Cookies"})
# => #<Recipe:0x007fa7290debe8 @description=nil, @id=nil, @name="Chocolate Cookies">

Recipe.new({name: "Chocolate Cookies", description: "Some great Cookies with chocolate chips"})
# => #<Recipe:0x007fa729233d90 @description="Some great Cookies with chocolate chips", @id=nil, @name="Chocolate Cookies">

Note the = {} which also lets you call Recipe.new without any argument.

Recipe.new
# => #<Recipe:0x007fa7293935c8 @description=nil, @id=nil, @name=nil>