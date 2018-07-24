

def bubble_sort(array)
=begin
loop through each item
check each item with the next item
if the item is greater than the one to the right, swap the items
loop through the array until no swapping has occurred
=end

  sorted = false
  while !sorted
    sorted = true
    for i in (1..array.length-1)
      if array[i-1] > array[i]
        array[i-1], array[i] = array[i], array[i-1]
        sorted = false
      end
    end
  end
  return array
end


p bubble_sort([1,2,3,4,5]) == [1, 2, 3, 4, 5] ? "Test 1: Passed" : "Test 1: Failed"
p bubble_sort([2,5,4,3,1]) == [1, 2, 3, 4, 5] ? "Test 2: Passed" : "Test 2: Failed"
p bubble_sort([1,5,3,4,5]) == [1, 3, 4, 5, 5] ? "Test 3: Passed" : "Test 3: Failed"
p bubble_sort([1,-5,3,-4,5]) == [-5, -4, 1, 3, 5] ? "Test 4: Passed" : "Test 4: Failed"

randomArray = 999.times.map{Random.rand(-99999..99999)}
p bubble_sort(randomArray) == randomArray.sort ? "Test 5: Passed" : "Test 5: Failed"
