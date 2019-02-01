class Isogram

  def self.isogram?(string)
    hash = Hash.new(0)
    output = true
    string.chars.each do |char|
      char.downcase!
      hash[char] += 1
      output = false if hash[char] > 1 && /\w/.match(char)
    end
    output
  end

end
