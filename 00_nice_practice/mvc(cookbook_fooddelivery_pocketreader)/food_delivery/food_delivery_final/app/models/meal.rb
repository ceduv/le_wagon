class Meal
  attr_accessor :id, :name, :price

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end
end
