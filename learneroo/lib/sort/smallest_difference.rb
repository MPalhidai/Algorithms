def min_dif(arr, n)
  arr.sort!
  diff = Float::INFINITY
  array = []
  (0...n-1).each do |i|
    if arr[i+1] - arr[i] < diff
      diff = arr[i+1] - arr[i]
      array = [arr[i], arr[i+1]]
    end
  end
  array
end



input = [[-20, -3916237, -357920, -3620601, 7374819, -7330761, 30, 6246457, -6461594, 266854], [1000, -3916237, -357920, -3620601, 7374819, -7330761, 1003, 6246457, -6461594, 266854]]
output = [[-20, 30], [1000, 1003]]

def test(input, output)
  input.each_with_index do |try, idx|
    puts min_dif(try, try.size) == output[idx]
  end
end

test(input, output)
