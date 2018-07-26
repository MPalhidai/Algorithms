# You're working on a scheduler app. The user would like to attend as many events as possible but cannot attend events that overlap. Can you find the schedule with the greatest number of non-overlapping events?
#
# See if you can find an O(n log n) solution.

#what if sort by lowest start times and only choose the smallest diff then then kick the index to its finish time

def scheduler(ar)
  mergeSort(ar)

end

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
  elsif left.first.first <= right.first.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

a = [[4, 8], [1, 3], [7, 9], [5, 6]]
b = [3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14]
c = [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]

print scheduler(a)

# correct
# [1, 3] [5, 6] [7, 9]
# [1, 2] [4, 5] [8, 14]
# [0, 1] [3, 5] [7, 9] [10, 12] [14, 16]
