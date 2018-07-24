test_1 = [[0, "ab"], [6, "cd"], [0, "ef"], [6, "gh"], [4, "ij"], [0, "ab"], [6, "cd"], [0, "ef"], [6, "gh"], [0, "ij"], [4, "that"], [3, "be"], [0, "to"], [1, "be"], [5, "question"], [1, "or"], [2, "not"], [4, "is"], [2, "to"], [4, "the"]]

def mergeSort(ar, temp = [], leftStart = 0, rightEnd = ar.length-1)
  return if leftStart >= rightEnd
  middle = (leftStart + rightEnd) / 2
  mergeSort(ar, temp, leftStart, middle)
  mergeSort(ar, temp, middle + 1, rightEnd)
  mergeHalves(ar, temp, leftStart, rightEnd)
end

def mergeHalves(ar, temp, leftStart, rightEnd)
  leftEnd = (leftStart + rightEnd) / 2
  rightStart = leftEnd + 1

  left = leftStart
  right = rightStart
  index = leftStart

  while left <= leftEnd && right <= rightEnd
    if ar[left].first <= ar[right].first
      temp[index] = ar[left]
      left += 1
    else
      temp[index] = ar[right]
      right += 1
    end
    index += 1
  end

  while left <= leftEnd
    temp[index] = ar[left]
    left += 1
    index += 1
  end

  while right <= rightEnd
    temp[index] = ar[right]
    right += 1
    index += 1
  end

  ar = temp
end

puts mergeSort(test_1) == "ab ef ab ef ij to be or not to be ij that is the question cd gh cd gh"
print mergeSort(test_1)
