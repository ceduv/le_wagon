require_relative 'Animal'

class Lion < Animal

  def initialize(name)
    super(name)
    @verb = "roars"
  end

  def eats(food)
    # "#{super(food)} Law of the Jungle!"
    # [super(food), "Law of the Jungle!"].join(' ')
    super(food) + " Law of the Jungle!"
  end
end
