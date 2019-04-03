class BaseConverter
  def self.convert(input_base, digits, output_base)
    @input_base = input_base
    @digits = digits
    @output_base = output_base

    raise ArgumentError if invalid_base || invalid_digits

    find_total
    return [@total] if @total == 0
    
    find_max_power
    to_output
  end

  private

  def self.invalid_base
    @input_base < 2 || @output_base < 2
  end

  def self.invalid_digits
    @digits.any?{ |digit| digit < 0 || digit >= @input_base }
  end

  def self.find_total
    @total = 0
    @digits.reverse.each_with_index do |value, index|
      @total += @input_base ** index * value
    end
  end

  def self.find_max_power
    @max_power = 0
    until @total / (@output_base ** @max_power) == 0
      @max_power += 1
    end
  end

  def self.to_output
    output = []
    while @max_power > 0
      @max_power -= 1
      output << @total / (@output_base ** @max_power)
      @total %= (@output_base ** @max_power)
    end
    output
  end
end
