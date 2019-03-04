class Triangle
  def initialize(sides)
    raise ArrgumentError if sides.length != 3
    @a = sides[0]
    @b = sides[1]
    @c = sides[2]
  end

  def equilateral?
    return false if invalid?
    @a == @b && @b == @c
  end

  def isosceles?
    return false if invalid?
    (@a == @b && @a != @c) ||  (@b == @c && @b != @a) || (@a == @c && @b != @a) || equilateral?
  end

  def scalene?
    return false if invalid?
    @a != @b && @b != @c
  end

  private

  def invalid?
    array = [@a, @b, @c]
    output = false
    for index in 0...array.length
      if array[index] <= 0 || array[index] + array[index-1] <= array[index-2]
        output = true
        break
      end
    end
    output
  end
end
