def my_map(array)
  # TODO: Re-implement the same behavior as `Enumerable#map` without using it! You can use `#each` though.
  new_array = []
  array.each do |element|
    new_array << yield(element)
  end
  new_array
end
