require_relative "animal"
class Chicken < Animal
  attr_reader :gender, :eggs

  def initialize(gender)
    super()
    @gender = gender
    @eggs = 0
  end

  def feed!
    super
    @eggs += 2 if @gender == "female"
  end

  def talk
    @gender == "female" ? "cluck cluck" : "cock-a-doodle-doo"
  end
end
