class Scale
  @@chromatic_scale = {
    sharps: %w(A A# B C C# D D# E F F# G G#),
    flats: %w(A Bb B C Db D Eb E F Gb G Ab),
    choose: %w(Ab Bb Db Eb F Gb c bb d eb f g),
  }

  @@intervals = {
    m: 1,
    M: 2,
    A: 3
  }

  def initialize(tonic, scale, interval = 'mmmmmmmmmmmm')
    @tonic = tonic
    @scale = scale
    @interval = interval_values(interval)
  end

  def name
    "#{@tonic.capitalize} #{@scale.to_s}"
  end

  def pitches
    @@chromatic_scale[:choose].include?(@tonic) ? start = @@chromatic_scale[:flats] : start = @@chromatic_scale[:sharps]
    output = []

    until start[0] == @tonic.capitalize
      start.rotate!
    end

    for i in 0...@interval.length
      output << start[0]
      start.rotate!(@interval[i])
    end

    output
  end

  private

  def interval_values(string)
    string.chars.map{ |char| @@intervals[char.to_sym] }
  end
end
