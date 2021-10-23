def group_anagrams(words)
  groups = {} # crash_word => words
  words.each do |word|
    crash_word = word.downcase.chars.sort.join
    if groups[crash_word]
      groups[crash_word] << word
    else
      groups[crash_word] = [word]
    end
  end
  groups.values
end
