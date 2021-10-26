DISHES_CALORIES = {
  "Hamburger" => 250,
  "Cheese Burger" => 300,
  "Big Mac" => 540,
  "McChicken" => 350,
  "French Fries" => 230,
  "Salad" => 15,
  "Coca Cola" => 150,
  "Sprite" => 150
}

MENU = {
  "Happy Meal" =>	["Cheese Burger", "French Fries", "Coca Cola"],
  "Best Of Big Mac" =>	["Big Mac", "French Fries", "Coca Cola"],
  "Best Of McChicken" => ["McChicken", "Salad", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  DISHES_CALORIES[burger] + DISHES_CALORIES[side] + DISHES_CALORIES[beverage]
  # parameter a passer an array
  # on itere et on sum
end

def calories_counter(orders)
  # TODO: return number of calories for a less constrained order
  calories = 0
  orders.each do |element| # key + value ?
    if DISHES_CALORIES.key?(element)
      calories += DISHES_CALORIES[element]
    else # iterer sur la valeur et non sur la key
      calories += poor_calories_counter(MENU[element][0], MENU[element][1], MENU[element][2])
      # si on lui passe un tableau a lieu du de 3 elements on peu boucler dessus
    end
  end
  calories
end
