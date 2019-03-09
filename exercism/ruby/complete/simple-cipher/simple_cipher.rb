class Cipher
  attr_reader :key

  def initialize(key = 'aaaaaaaaaa')
    @key = key
    raise ArgumentError unless /\A[a-z]+\z/.match(key)
  end

  def encode(plaintext)
    for i in 0...plaintext.length
      plaintext[i] = (((plaintext[i].ord - 97) + (@key[i].ord - 97)) % 26 + 97).chr
    end
    plaintext
  end

  def decode(ciphertext)
    for i in 0...ciphertext.length
      ciphertext[i] = (((ciphertext[i].ord - 97) - (@key[i].ord - 97)) % 26 + 97).chr
    end
    ciphertext
  end
end
