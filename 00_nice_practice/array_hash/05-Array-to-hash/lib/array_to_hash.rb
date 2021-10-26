def array_to_hash(array)
  # TODO: implement the method :)
  hash = {}
  array.each_with_index do |element, index|
    block_given? ? hash[yield(index.to_s)] = element : hash[index.to_s] = element
  end
  hash
end
