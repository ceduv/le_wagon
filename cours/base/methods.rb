def say_hi(name) # parameter
  name = name.capitalize
  return "Hi #{name}."
end

puts say_hi("julien") # argument
# => "Hi Julien."
# => "Hi Diane."


def max(number_1, number_2)
  # puts number_1 #+> 4
  if number_1 > number_2
    return number_1
  else
    return number_2
  end
end

first_number = 4
second_number = 5

puts max(first_number, second_number)
# => 5

require 'date'

def tomorrow
  tomorrow_date = Date.today + 1
  return tomorrow_date.strftime("%B %d") # string from time to format a date correctly
end

puts tomorrow
