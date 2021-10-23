require_relative 'Animal'

class Meerkat < Animal

  def initialize(name)
    super(name)
    @verb = "barks"
  end
end
