class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  def data_for_csv
    [@name, @descrition]
  end
end
