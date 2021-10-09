# Welcome the player with a message
puts "Welcome to the price is right 🤑"

# Define the targeted price
price = (1..100).to_a.sample
# initialize the variable user_choice
min = 1
max = 100
user_choice = 0
counter = 0

while price != user_choice # breaking condition
  # Ask a price to the player
  puts "Guess a price"
  print "> "
  # user_choice = gets.chomp.to_i
  user_choice = (max + min) / 2
  # Display to the user if the price is superior or inferior
  if user_choice < price
    puts "It's more"
    min = user_choice
  elsif user_choice > price
    puts "It's less"
    max = user_choice
  end
  counter = counter + 1
end

# Congratulate the player when the price is correct with the number of tries
puts "You won in #{counter} tries. The price was #{price}€! 🎉"
