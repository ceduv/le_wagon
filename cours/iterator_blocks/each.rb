beatles = ["John Lennon", "Paul MacCartney", "Ringo Starr", "George Harrison"]

# puts "~"*15

# beatles.each do |beatle|
#   puts "- #{beatle}"
# end

# puts "~"*15

# beatles.each { |beatle| puts "- #{beatle}" }

# puts "~"*15

# beatles.each_with_index do |beatle, index|
#   puts "#{index + 1}. #{beatle}"
# end

# puts "~"*15

# puts "USING EACH 👇"
# beatles_first_names = []
# beatles.each do |beatle|
#   first_name = beatle.split.first
#   beatles_first_names.push(first_name)
# end

# p beatles_first_names

# puts "~"*15

# puts "USING MAP 👇"
# beatles_first_names_with_map = beatles.map do |beatle|
#   beatle.split.first
# end

# # attention à ce que le block renvoie avec #map !! ⚠️
# # beatles_first_names_with_map = beatles.map do |beatle|
# #   if beatle.start_with?('J')
# #     beatle.split.first
# #   end
# # end

# p beatles_first_names_with_map

# #count => +1 if the block return something truthy
# counter = beatles.count do |beatle|
#   beatle.include?('rr')
# end

# p counter

# select => builds new array with elements for which block returns something truthy
beatles_with_rr = beatles.select do |beatle|
  beatle.include?('rr')
end

p beatles_with_rr

beatles_without_rr = beatles.reject do |beatle|
  beatle.include?('rr')
end

p beatles_without_rr











