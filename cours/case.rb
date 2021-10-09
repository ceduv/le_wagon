puts "What do you want to eat?"
# print ">"
choice = gets.chomp.strip

case choice
when "meat", "beef"
  puts "here is your meat"
when "fish"
  puts "here is your fish"
when "vegan"
  puts "here is your vegan meal"
else
  puts "unknown"
end
