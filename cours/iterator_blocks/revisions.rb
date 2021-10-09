beatles = ["John Lennon", "Paul MacCartney", "Ringo Starr", "George Harrison"]

puts "~"*15

for beatle in beatles
  puts "- #{beatle}"
end

puts "~"*15

for i in (0...beatles.length)
  puts "#{i + 1}. #{beatles[i]}"
end

puts "~"*15
