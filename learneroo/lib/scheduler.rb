# You're working on a scheduler app. The user would like to attend as many events as possible but cannot attend events that overlap. Can you find the schedule with the greatest number of non-overlapping events?
#
# See if you can find an O(n log n) solution.

class Event
  attr_accessor :start, :finish, :overlaps, :id

  def initialize(start = 0, finish = 0, overlaps = 0)
    @start = start
    @finish = finish
    @overlaps = overlaps
  end
end

#each tuple count number of overlaps and chose tuples with lowest counts until a tuple overlaps one already chosen

def scheduler(ar)
  schedule = []
  idx = 0
	ar.each_slice(2) do |start,finish|
    timeslot = Event.new
    timeslot.start = start
    timeslot.finish = finish
    timeslot.id = idx
    idx += 1
    schedule << timeslot
	end
  puts schedule[1].id
  puts schedule[1].start
  puts schedule[1].finish
  puts schedule[1].overlaps
end

a = [4, 8, 1, 3, 7, 9, 5, 6]
b = [3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14]
c = [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]

puts scheduler(a)

# correct
# [1, 3] [5, 6] [7, 9]
# [1, 2] [4, 5] [8, 14]
# [0, 1] [3, 5] [7, 9] [10, 12] [14, 16]
