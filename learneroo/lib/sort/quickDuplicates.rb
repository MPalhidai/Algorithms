def quickDuplicates(left, right)
  count = Hash.new(0)
	left.each{|i| count[i] += 1}
  right.each{|i| count[i] -= 1}
	count.each{|k,v| print "#{k} " if v != 0}
	puts
end

quickDuplicates([203, 204, 205, 206, 207, 208, 203, 204, 205, 206],[203, 204, 204, 205, 206, 207, 205, 208, 203, 206, 204, 205, 206])
