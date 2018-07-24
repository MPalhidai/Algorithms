def recursiveInsertionSort(arr, n)
  # base case
  return if n.nil? || n < 2
  # Sort first n-1 elements
  recursiveInsertionSort(arr, n-1)
  # Insert last element at its correct position
  #     in sorted array.
  last = arr[n-1]
  j = n-2
    # Move elements of arr[0..i-1], that are
    # greater than key, to one position ahead
    # of their current position
  while j >= 0 && !last.nil? && arr[j] > last
      arr[j+1] = arr[j]
      j = j-1
	end

  arr[j+1] = last
	print arr.join(" ")
	puts
end

tests = []
results = []
tests << "1 4 3 6 9 2".split.map{|c|c.to_i}
tests << "9 8 6 7 3 5 4 1 2".split.map{|c|c.to_i}

results << "1 4 3 6 9 2
1 3 4 6 9 2
1 3 4 6 9 2
1 3 4 6 9 2
1 2 3 4 6 9 "
results << "8 9 6 7 3 5 4 1 2
6 8 9 7 3 5 4 1 2
6 7 8 9 3 5 4 1 2
3 6 7 8 9 5 4 1 2
3 5 6 7 8 9 4 1 2
3 4 5 6 7 8 9 1 2
1 3 4 5 6 7 8 9 2
1 2 3 4 5 6 7 8 9 "

tests.each do |try|
	n = try.size
	a = try
	recursiveInsertionSort(a, n)
	puts
end
