def bubble_sort_by(array)
  sorted = false
  while !sorted
    sorted = true
    index = 0
    array.each_cons(2) do |elem|
      if yield(elem) > 0
        sorted = false
        array[index],array[index + 1] = array[index + 1], array[index]
      end
      index += 1
    end
  end
  array
end


p bubble_sort_by([1,1,-5,3,-4,5]) {|left, right| left <=> right }
p bubble_sort_by(["hi","hello","hey"]) {|left, right| left.length - right.length }

randomArray = 999.times.map{Random.rand(-99999..99999)}
p bubble_sort_by(randomArray) {|left, right| left <=> right } == randomArray.sort ? "Test 5: Passed" : "Test 5: Failed"
