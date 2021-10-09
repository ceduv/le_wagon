# This file contains methods related to your store and its supplies.
# You should complete it according to the instructions in the TODO comments

def store_items
  # TODO: find the correct data structure to hold the shopping store items
  # instead of using nil below
  store = {
    'meat' => 7,
    'potatoes' => 2,
    'rice' => 1,
    'vegetables' => 5,
    'yogurts' => 2
  }

  return store
end

def product_in_store?(product)
  # TODO: Check whether product is present in the store items
  store_items.key?(product)
end

def price_of_product(product)
  # TODO: Return the price of the given product, if it's in store. nil otherwise
  store_items[product]
end

def store_items_to_s
  # TODO: Return a String with all store items in the following form:
  # - Meat: 7 euros
  # - Vegetables: 5 euros
  # ...
  #
  # HINT: add line breaks in your String with "\n"
  items = []
  store_items.each do |store_item, price|
    items << "- #{store_item}: #{price} €"
  end

  items.join("\n")
end
