restaurant = Restaurant.new(name: "La Tour d'Argent")
restaurant.valid?
# => false
restaurant.errors.messages
# => { stars: [ "can't be blank" ] }