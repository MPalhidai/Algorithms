class Series
  def initialize(string)
    @array = string.scan(/[0-9]/)
    raise ArgumentError if string.length != @array.length
    @array.map!(&:to_i)
  end

  def largest_product(size)
    raise ArgumentError if size > @array.length || size < 0
    return 1 if size == 0
    max = 0
    for i in 0..(@array.length - size)
      product = @array[i...i+size].reduce(:*)
      max = product if product > max
    end
    max
  end
end
