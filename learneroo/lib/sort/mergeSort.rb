test_1 = [[0, "ab"], [6, "cd"], [0, "ef"], [6, "gh"], [4, "ij"], [0, "ab"], [6, "cd"], [0, "ef"], [6, "gh"], [0, "ij"], [4, "that"], [3, "be"], [0, "to"], [1, "be"], [5, "question"], [1, "or"], [2, "not"], [4, "is"], [2, "to"], [4, "the"]]



# its backward

def mergeSort(ar)
  if ar.length <= 1
    ar
  else
    middle = (ar.length / 2).floor
    left = mergeSort(ar[0...middle])
    right = mergeSort(ar[middle..ar.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first.first < right.first.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

puts mergeSort(test_1) == "ab ef ab ef ij to be or not to be ij that is the question cd gh cd gh"
print mergeSort(test_1).map{ |pair| pair.last}.join(" ")
