beatles = ["John Lennon", "Paul MacCartney", "Ringo Starr", "George Harrison"]

# first_names = beatles.map do |full_name|
#   full_name.split.first
# end

# p first_names

# def first_name_from_full_name(full_name)
#   full_name.split.first
# end
# p first_name_from_full_name("John Lennon")

# # 👇 un block est une méthode anonyme
# do |full_name|
#   full_name.split.first
# end

# comme une méthode, le block :
# - peut prendre des arguments (entre |)
# - renvoie qlq chose
# un bloc peut être passé à une méthode, comme un argument un peu particulier

# en ruby, on peut passer un block a tout les méthodes => ça ne raisera jamais d'erreur
def hello
  puts "hello world"
  if block_given?
    yield
  end
end

# hello("something")
hello
hello { puts "heyyyyy!!!" }
