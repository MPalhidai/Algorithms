class PhoneNumber
  def self.clean(string)
    numbers = string.scan(/[0-9]/)
    n = numbers.length
    if n == 10 || n == 11
      return nil if n == 11 && numbers[0].to_i != 1
      numbers = numbers.last(10)
      numbers.join if numbers[0].to_i > 1 && numbers[3].to_i > 1
    end
  end
end
