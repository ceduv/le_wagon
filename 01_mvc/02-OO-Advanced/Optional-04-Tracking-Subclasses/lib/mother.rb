class Mother
  @kids = [] # variable d instance de class ***

  def self.inherited(subclass)
    @kids << subclass
  end

  def self.phone_kids
    @kids.each { |kid| kid.phone }
    # map pour renvoyer
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
