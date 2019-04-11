class CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError if number < 1
    return count if number == 1
    number.odd? ? steps(3 * number + 1, count + 1) : steps(number / 2, count + 1)
  end
end
