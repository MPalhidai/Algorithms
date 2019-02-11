class RailFenceCipher
  def self.encode(plaintext, rails)
    zigzag(rails, plaintext.length).zip(plaintext.chars).sort.map {|a| a[1]}.join
  end

  def self.decode(encryptedtext, rails)
    zigzag(rails, encryptedtext.length).sort.zip(encryptedtext.chars).sort_by {|a| a[0][1]}.map {|a| a[1]}.join
  end

  private

  def self.zigzag(rails, size)
    ((0..rails-1).to_a + (1..rails -2).to_a.reverse).cycle.first(size).zip(0..size)
  end
end
