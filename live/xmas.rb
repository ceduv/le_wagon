require 'date'

def days_until_xmas(someday)
  # Define the christmas date of the current year
  xmas_date = Date.new(someday.year, 12, 25)
  if someday > xmas_date
    xmas_date = xmas_date.next_year
  end
  # Count the number of days between christmas and someday
  return (xmas_date - someday).to_i
end

# Test Driven Development
puts days_until_xmas(Date.new(2021, 12, 24)) == 1
puts days_until_xmas(Date.new(2021, 10, 5)) == 81
puts days_until_xmas(Date.new(2022, 10, 5)) == 81
puts days_until_xmas(Date.new(2021, 12, 26)) == 364
