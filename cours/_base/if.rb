# age = 16

# if age >= 18
#   puts "I can vote"
# end

# if []
#   puts "i'm truthy"
# end

# number = 7

# unless !number.odd?
#   puts "i am not divisible by 2"
# end

# if !(age >= 18)
#   # do some stuff
# end

age = 16

# if age >= 18
#   puts "I can vote"
# else
#   puts "I cannot vote"
# end

# def can_vote?(age)
#   return age >= 18
# end

# puts can_vote?(19)

# condition ? condition_si_vrai : condition_si_faux


# Ask user choice
# Flip the coin
# compare
# give the resut

# puts "Heads or tails ?"
# print ">"
# choice = gets.chomp.to_i

# coin = ["heads", "tails"].sample

# result = choice == coin ? "win" : "lose"

# puts "You #{result}"

# number.even? ? number/2 : number

puts "I can vote" if age >= 18
puts "I cannot vote" unless age >=18

age >= 18 ? "I can vote" : "I cannot vote"
