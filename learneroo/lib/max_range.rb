# You're only able to stay in the hotel if an event is running. Can you find and print the maximum time ranges that you can stay in the hotel?
#
# See if you can find an O(n log n) solution. much easier than last challenge but I'll solve first before going back to implement a recursive graph search. BFS with visited flag on Event


class Event
  attr_accessor :start_time, :end_time, :overlaps, :visited

  def initialize(start_time, end_time, overlaps=[])
    @start_time = start_time
    @end_time = end_time
    @overlaps = overlaps
    @visited = false
  end
end


def scheduler(a)

  events = Array.new
  schedule = Array.new

  a.each_slice(2) do |start, finish|
    meeting = Event.new(start, finish)
    events << meeting
  end

  overlaps?(events)
  events.sort_by!{ |event| event.start_time }
  events.each do |timeslot|
    unless timeslot.visited
      $eviction = 0
      breadth_first_search(timeslot, queue = [])
      schedule << timeslot.start_time
      schedule << $eviction
    end
  end

  schedule.each_slice(2){ |start, finish| print "[#{start}, #{finish}] " }

  puts
end

def breadth_first_search(node, queue = [])
  $eviction = node.end_time if node.end_time > $eviction
  node.visited = true
  node.overlaps.each{ |conn| queue << conn unless conn.visited }
  breadth_first_search(queue.shift, queue) unless queue.empty?
end

def overlaps?(events)
  for i in (0...events.length)
    for j in (0...events.length)
      if events[i].end_time >= events[j].start_time && events[i].start_time <= events[j].start_time
        events[i].overlaps << events[j]
      end
    end
  end
end

tests = Array.new

tests << [10, 18, 4, 6, 14, 16, 5, 8]
tests << [5, 14, 1, 4, 13, 19, 3, 6, 9, 8]
tests << [11, 12, 4, 7, 14, 16, 0, 2, 13, 15, 8, 10]
tests << [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]


tests.each do |example|
  scheduler(example)
end

# correct
# [4, 8] [10, 18]
# [1, 19]
# [0, 2] [4, 7] [8, 10] [11, 12] [13, 16]
# [0, 1] [3, 16]
