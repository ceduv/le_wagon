def beautiful_name(first_name, last_name)
  full_name = "#{first_name} #{last_name.upcase}"
  yield(full_name)
end

beautiful_name("John", "Doe") do |name|
  puts "Hello #{name}"
end
