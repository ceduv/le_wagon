def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  hash = {}
  File.open(file_name, "r").each_line do |line|
    words_array = line.split
  end
  words_array.each { |word| hash[word] += 1 }
  return hash
end
