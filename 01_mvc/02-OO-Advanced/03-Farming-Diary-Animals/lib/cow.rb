require_relative "animal"
class Cow < Animal
  attr_reader :energy, :milk

  def initialize
    super()
    @milk = 0
  end

  def feed!
    super
    @milk += 2
  end

  def talk
    "moo"
  end
end
