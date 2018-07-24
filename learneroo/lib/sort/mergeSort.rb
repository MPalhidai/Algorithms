test_1 = [1, 3, 9, 11, 2, 4, 6, 8]

def mergeSort(ar)
  left = 0
  right = ar.length/2
  sorted_ar = []
  while left < ar.length/2 && right < ar.length
    if ar[left] <= ar[right]
      sorted_ar << ar[left]
      left += 1
    else
      sorted_ar << ar[right]
      right += 1
    end
  end

  while left < ar.length/2
    sorted_ar << ar[left]
    left += 1
  end

  while right < ar.length
    sorted_ar << ar[right]
    right += 1
  end

  print sorted_ar.join(" ")
  puts
end

puts mergeSort(test_1) == "1 2 3 4 6 8 9 11"
