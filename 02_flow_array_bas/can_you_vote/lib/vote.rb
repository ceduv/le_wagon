def allowed_to_vote?(age)
  if age >= 18
    true
  else
    false
  end
end

# Shorter solution:
# def allowed_to_vote?(age)
#   age >= 18
# end
