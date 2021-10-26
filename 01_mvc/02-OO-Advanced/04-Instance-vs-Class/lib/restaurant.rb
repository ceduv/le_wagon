class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city, :name

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @ratings = []
  end
  # TODO: implement .filter_by_city and #rate methods

  def rate(new_rate)
    @ratings << new_rate
    @average_rating = @ratings.sum.fdiv(@ratings.count)
  end

  def self.filter_by_city(restaurants, city)
    restaurants.find_all { |restaurant| restaurant.city == city }
    # vu que restaurant == object on peu call.city dessus
  end
end
