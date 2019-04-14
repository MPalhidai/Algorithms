class IsbnVerifier
  def self.valid?(string)
    multiplier = 10
    index = 0
    total = 0
    n = string.length
    while index < n
      if string[index] == '-'
        return false unless index == 1 || index == 5 || index == 11
      elsif index == n - 1 && /[0-9X]/.match(string[index])
        string[index] == 'X' ? convert = 10 : convert = string[index].to_i
        total += multiplier * convert
        multiplier -= 1
      elsif /[0-9]/.match(string[index])
        total += multiplier * string[index].to_i
        multiplier -= 1
      else
        return false
      end
      index += 1
    end

    total % 11 == 0 && multiplier == 0
  end
end
