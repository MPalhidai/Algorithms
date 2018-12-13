def equillibriumIndex(array)
  left_sum = 0
  right_sum = array.reduce(:+)
  output = []
  array.each_with_index do |number, index|
    right_sum -= number
    output << index if left_sum == right_sum
    left_sum += number
  end
  output.join(' ')
end








input = [[-7, 1, 5, 2, -4, 3, 0]]
input << [1, 2, 3, 4, 5, 4, 2, 3, 1]
input << [-1, 1, -2, 3, -2, 0, 1, 3, -2, 3, -1]
input << [2, 6, -3, 11, 0, 4, -8, 0, 13, 4, 3]
input.each{ |try| puts equillibriumIndex(try) }
