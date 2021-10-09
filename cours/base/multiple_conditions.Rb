# Open 9h-12h - 14h-19h
hour = 12

def open?(hour)
  # if more than 9h
  # AND less than 19
  (hour >= 9 && hour < 12) || (hour >= 14 && hour < 19)
end
