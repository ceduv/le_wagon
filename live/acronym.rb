def acronym(expression)
  # split to words
  words = expression.gsub("!", "").gsub("?", "").split
  # first letter
  initials = ""
  words.each do |word|
    characters = word.split("")
    first_letter = characters[0]
    initials << first_letter
  end
  return initials.upcase
end


puts acronym("What the fuck") == "WTF"
puts acronym("Laughing   Out Loud") == "LOL"
puts acronym("be right back !") == "BRB"
puts acronym("") == ""
