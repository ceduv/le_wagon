# Use the map iterator to convert the variable students,
# an array of arrays, into an array of hashes.Those hashes
# should have two keys: :name and :age

students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

students.map do |student|               # on map sur un tab de tab
  { name: student[0], age: student[1] } # on attribut une cle hash pour chaque elmt du tab
end
#===
students.map do |name, age|
  { name: name, age: age }
end
# Avec plus de 2 donne ds le tableau
students = [ [ "john", "doe", 28 ] ]

students.map do |firstname,lastname,age|
    { name: firstname, lastname: lastname, age: age }
end
#=> [{:name=>"john", :lastname=>"doe", :age=>28}]

#--------------------------------------------

# Methode qui permet de array => hash
# en passant un block avec yield pour adapter la key

def array_to_hash(array)
    hash = {}
    array.each_with_index do |element, index|
      block_given? ? hash[yield(index.to_s)] = element : hash[index.to_s] = element
    end
    hash
end
#===
def array_to_hash(array)
  hash = {}                                        # create empty hash
  array.each_with_index do |item, index|           # loop over array
    key = block_given? ? yield(index) : index.to_s # ternary to set the key in both cases
    hash[key] = item                               # set the new key/value pair
  end
  return hash                                      # return built hash
end

#------------------BASE----------------------

city = { name: "Paris", population: 2000000 }
​
# Print out the name of the city
puts city[:name]
# Add the Eiffel Tower to city with the `:monument` key
city[:monument] = "Tour Eiffel"
# .push` && `<<` => strictement reservé aux arrays ou strings
# Update the population to 2000001
city[:population] = 2_000_001
# What will the following code return?
city[:mayor] # => nil
# Delete the key/value `:monument
city.delete(:monument)
​
#-------------FLATTEN------------------------

.flatten 
array = [["cedric",33],["alex",29]]
array.flatten
# renvoi # ne detruit as array
["cedric", 33, "alex", 29]
# *** .flatten!