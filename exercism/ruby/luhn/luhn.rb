class Luhn
  def self.valid?(string)
    numbers = []
    string.chars.each do |el|
      if /[0-9]/.match(el)
        numbers << el.to_i
      elsif !/[0-9 ]/.match(el)
        return false
      end
    end
    return false if numbers.length < 2
    i = numbers.length - 2
    while i >= 0
      numbers[i] *= 2
      numbers[i] -= 9 if numbers[i] > 9
      i -= 2
    end
    numbers.sum % 10 == 0
  end
end
