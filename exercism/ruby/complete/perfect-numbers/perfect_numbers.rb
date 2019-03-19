class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    factors = []
    (1..number/2).each do |factor|
      factors << factor if number % factor == 0
    end

    sum = factors.sum
    if sum > number
      'abundant'
    elsif sum < number
      'deficient'
    elsif sum == number
      'perfect'
    end
  end
end
