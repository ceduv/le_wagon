class Animal
  def self.phyla
    ["Ecdysozoa", "Lophotrochozoa", "Deuterostomia", "Other Bilateria phyla",
      "Non-Bilateria"]
  end

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def talk
    "#{@name} #{@verb}"
  end

  def eats(food)
    "#{@name} eats #{food}."
  end
end

# Animal.phyla
