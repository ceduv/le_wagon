require_relative 'Animal'

class Warthog < Animal

  def initialize(name)
    super(name)
    @verb = "grunts"
  end
end
