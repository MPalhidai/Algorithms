class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(args)
    @max = args[:max_factor]
    if args[:min_factor]
      @min = args[:min_factor]
      @multi_factor = true
    else
      @min = 1
      @multi_factor = false
    end
  end

  def generate
    @hash = {}
    (@min..@max).each do |first|
      (@min..@max).each do |second|
        product = first * second
        if @multi_factor && product.to_s == product.to_s.reverse
          if @hash[product]
            @hash[product] << [first, second] unless @hash[product].include?([second, first])
          else
            @hash[product] = [[first, second]]
          end
        elsif !@multi_factor && product == @max
          if @hash[product]
            @hash[product] << [first, second] unless @hash[product].include?([second, first])
          else
            @hash[product] = [[first, second]]
          end
        end
      end
    end
  end

  def largest
    value = @hash.keys.max
    factors = @hash[value].uniq
    Palindrome.new(value, factors)
  end

  def smallest
    value = @hash.keys.min
    factors = @hash[value].uniq
    Palindrome.new(value, factors)
  end
end
