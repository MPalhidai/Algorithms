class Grains
  def self.square(n)
    raise ArgumentError if n < 1 || n > 64
    2**(n-1)
  end

  def self.total
    (1..64).reduce(0) { |sum, num| sum + square(num) }
  end
end
