# You're working on a scheduler app. The user would like to attend as many events as possible but cannot attend events that overlap. Can you find the schedule with the greatest number of non-overlapping events?
#
# See if you can find an O(n log n) solution.

#what if sort by lowest start times and only choose the smallest diff then then kick the index to its finish time

class Event
  attr_accessor :start_time, :end_time, :overlaps

  def initialize(start_time, end_time, overlaps=0)
    @start_time = start_time
    @end_time = end_time
    @overlaps = overlaps
  end
end


def scheduler(a)

  events = Array.new
  schedule = Array.new

  a.each_slice(2) do |start, finish|
    meeting = Event.new(start, finish)
    events << meeting
  end

  no_overlaps?(events)

  #if the array is huge with no overlaps == 0 change this to select the event with the smallest overlap
  schedule = events.select{ |event| event.overlaps == 0 }

  events.sort_by!{ |event| event.overlaps }

  events.each{ |data| events.delete(data) if schedule.include?(data) }

  events.each{ |remaining| schedule << remaining if can_event_fit_in_schedule?(remaining, schedule) }

  schedule.sort_by!{ |timeslot| timeslot.start_time }

  schedule.each{ |selected| print "[#{selected.start_time}, #{selected.end_time}] " }

  puts
end

def can_event_fit_in_schedule?(event, schedule) #not working
  schedule.none?{ |scheduled| event.end_time >= scheduled.start_time && event.start_time <= scheduled.start_time }
end

def no_overlaps?(events)
  for i in (0...events.length)
    for j in (0...events.length)
      if events[i].end_time >= events[j].start_time && events[i].start_time <= events[j].start_time && i != j
        events[i].overlaps += 1
      end
    end
  end
end

tests = Array.new

tests << [4, 8, 1, 3, 7, 9, 5, 6]
tests << [3, 8, 1, 2, 3, 9, 1, 5, 4, 5, 8, 14]
tests << [0, 1, 14, 16, 4, 8, 10, 12, 7, 9, 8, 15, 3, 5]

tests.each do |example|
  scheduler(example)
end

# correct
# [1, 3] [5, 6] [7, 9]
# [1, 2] [4, 5] [8, 14]
# [0, 1] [3, 5] [7, 9] [10, 12] [14, 16]
