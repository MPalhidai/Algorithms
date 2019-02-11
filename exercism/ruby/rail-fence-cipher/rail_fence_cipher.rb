class RailFenceCipher
  def self.encode(plaintext, rails)
    return plaintext if invalid?(plaintext, rails)
    zigzag(plaintext, rails)
    @hash.values.flatten.join
  end

  def self.decode(encryptedtext, rails)
    return encryptedtext if invalid?(encryptedtext, rails)
    zigzag(encryptedtext, rails)
    @hash.values.flatten.join
  end

  private

  def self.zigzag(text, rails)
    @hash = {}
    (1..rails).each{|key| @hash[key] = []}
    key = 1
    up = true
    text.chars.each do |letter|
        @hash[key] << letter
        up ? key += 1 : key -= 1
        if key >= rails
            up = false
        elsif key <= 1
            up = true
        end
    end
  end

  def self.invalid?(text, rails)
    text == '' || rails == 1 || rails == text.length - 1
  end
end
