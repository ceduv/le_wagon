words_array = []
stop_words = []
hash = Hash.new(0)
# mes 2 files
File.open("lib/stop_words.txt", "r").each_line { |line| stop_words << line.split }
File.open("lib/source-text.txt", "r").each_line { |line| words_array << line.split }
# itere ajoute 1 pour chaque iteration
words_array.each { |word| hash[word] += 1 }
# on reclasse par le count
# tabReverse = hash.sort_by { |word, count| count }.reverse!

stop_words.each do |word|
  if words_array.include? word
    hash.except!(word)
  end
end

tabReverse = hash.sort_by { |word, count| count }.reverse!
puts hash
puts '===='
puts tabReverse
