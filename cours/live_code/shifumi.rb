# Computer plays : sample among possibilities
# Ask player for hand
# check hand validity
# Compare hands
# display result

HANDS = ["scissors", "rock", "paper"]

computer_answer = HANDS.sample

puts "Please choose:"
print ">"
player_answer = gets.chomp

until HANDS.include?(player_answer.downcase.strip)
  puts "Wrong choice, write better"
  print ">"
  player_answer = gets.chomp
end

result = if player_answer == computer_answer
  "DRAW"
elsif player_answer == "scissors"
  computer_answer == "rock" ? "LOSE" : "WIN"
elsif player_answer == "rock"
  computer_answer == "paper" ? "LOSE" : "WIN"
else
  computer_answer == "rock" ? "WIN" : "LOSE"
end

puts "It's a #{result}: computer chose #{computer_answer}"
