def palindrome?(a_string)
  return false if a_string.empty?
  a_string = a_string.downcase.delete("- ,!'")
  a_string == a_string.reverse
end
