def print_result
  p yield
  puts "ouhhh yeah!!"
end

print_result { 12345 * 1234455 }

print_result { "John Lennon".split.first.upcase }
