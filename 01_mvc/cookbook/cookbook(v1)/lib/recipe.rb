class Recipe # instance de recipe que je vais add a ma db
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end
