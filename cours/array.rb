beatles = ["john", "ringo", "paul"]

# beatles[1] = "george"
beatles << "george"

# beatles.delete_at(0)

# p beatles

beatles.each { |beatle| puts "Hello #{beatle}" }

def method_name
  i = 12
end

puts i
