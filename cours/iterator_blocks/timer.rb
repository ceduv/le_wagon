def measure
  puts "Let's start doing something!"
  start_time = Time.now

  # (1..1_000_000).to_a.shuffle.sort
  yield

  end_time = Time.now
  puts "Ok, it's finished!"
  elapsed_time = end_time - start_time
  puts "Elapsed time is: #{elapsed_time}s"
end

measure do
  (1..1_000_000).to_a.shuffle.sort
end

puts '~'*15

measure do
  (1..1_000_000).to_a.map{ |i| i - 1 }
end

# puts "Let's start doing something!"
# start_time = Time.now

# (1..1_000_000).to_a.shuffle.sort

# end_time = Time.now
# puts "Ok, it's finished!"
# elapsed_time = end_time - start_time
# puts "Elapsed time is: #{elapsed_time}s"



# puts "Let's start doing something!"
# start_time = Time.now

# (1..1_000_000).to_a.map{ |i| i - 1 }

# end_time = Time.now
# puts "Ok, it's finished!"
# elapsed_time = end_time - start_time
# puts "Elapsed time is: #{elapsed_time}s"
