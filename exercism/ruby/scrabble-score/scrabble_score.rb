module ExtendThroughInclude
  @@scores = {
    1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    2 => ['D', 'G'],
    3 => ['B', 'C', 'M', 'P'],
    4 => ['F', 'H', 'V', 'W', 'Y'],
    5 => ['K'],
    8 => ['J', 'X'],
    10 => ['Q', 'Z']
  }

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def score
    total = 0
    return total unless @string
    @string.chars.each do |char|
      char.upcase!
      @@scores.each do |k, v|
        total += k if v.include?(char)
      end
    end
    total
  end

  module ClassMethods
    @@scores = {
      1 => ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
      2 => ['D', 'G'],
      3 => ['B', 'C', 'M', 'P'],
      4 => ['F', 'H', 'V', 'W', 'Y'],
      5 => ['K'],
      8 => ['J', 'X'],
      10 => ['Q', 'Z']
    }

    def score(string)
      total = 0
      return total unless string
      string.chars.each do |char|
        char.upcase!
        @@scores.each do |k, v|
          total += k if v.include?(char)
        end
      end
      total
    end
  end
end


class Scrabble


  include ExtendThroughInclude

  def initialize(string)
    @string = string
  end

end
