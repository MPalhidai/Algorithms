class Clock

  attr_reader :minute, :hour

  def initialize(args)
    args[:minute] ? @minute = args[:minute] : @minute = 0
    args[:hour] ? @hour = args[:hour] : @hour = 0
  end

  def to_s
    h = hours.to_s
    m = minutes.to_s
    h = '0' + h if h.length < 2
    m = '0' + m if m.length < 2
    h + ':' + m
  end

  def +(clock)
    Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
  end

  def -(clock)
    Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
  end

  def ==(clock)
    (self - clock).to_s == '00:00'
  end

  private

  def hours
    (@hour + @minute / 60) % 24
  end

  def minutes
    @minute % 60
  end
end
