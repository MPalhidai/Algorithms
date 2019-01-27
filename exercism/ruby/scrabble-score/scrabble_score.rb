class Scrabble
  @@values = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def initialize(string)
    @string = string
    @score = 0
  end

  def score
    return @score unless @string
    @string.chars.each do |char|
      char.upcase!
      @@values.each do |k, v|
        @score += k if v.include?(char)
      end
    end
    @score
  end

  def self.score(string)
    Scrabble.new(string).score
  end
end
