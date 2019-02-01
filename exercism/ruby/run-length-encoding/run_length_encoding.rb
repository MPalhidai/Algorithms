class RunLengthEncoding
  def self.encode(input)
    output = ''
    letter = ''
    count = 0
    for i in 0..input.length
      letter = input[i] if i == 0
      if input[i] == letter
        count += 1
      else
        output += count.to_s if count > 1
        output += letter if letter != ''
        count = 1
        letter = input[i]
      end
    end
    output
  end

  def self.decode(encoded)
    output = ''
    count = ''
    encoded.chars.each do |char|
      if /[0-9]/.match(char)
        count += char
      else
        count != '' ? output += char * count.to_i : output += char
        count = ''
      end
    end
    output
  end
end
