class RotationalCipher
  def self.rotate(string, val)
    for i in 0...string.length
      ascii = string[i].ord
      if ascii >= 97 && ascii <= 122
        normalized_val = ascii - 97 + val
        normalized_val -= 26 if normalized_val >= 26
        string[i] = (normalized_val + 97).chr
      elsif ascii >= 65 && ascii <= 90
        normalized_val = ascii - 65 + val
        normalized_val -= 26 if normalized_val >= 26
        string[i] = (normalized_val + 65).chr
      end
    end
    string
  end
end
