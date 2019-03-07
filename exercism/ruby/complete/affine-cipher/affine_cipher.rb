class Affine
  @@M = 26

  def initialize(a, b)
    raise ArgumentError if @@M.gcd(a) > 1
    @a = a
    @b = b
  end

  def encode(plaintext)
    array = plaintext.scan(/[a-zA-Z0-9]/)
    for i in 0...array.length
      if /[a-z]/.match(array[i])
        x = array[i].ord - 97
      elsif /[A-Z]/.match(array[i])
        x = array[i].ord - 65
      end
      array[i] = (((@a * x + @b) % @@M) + 97).chr unless /[0-9]/.match(array[i])
    end
    array.each_slice(5).map{ |slice| slice.join }.join(' ')
  end

  def decode(ciphertext)
    array = ciphertext.scan(/[a-z0-9]/)
    for i in 0...array.length
      if /[a-z]/.match(array[i])
        y = array[i].ord - 97
        array[i] = ((modInverse * (y - @b) % @@M) + 97).chr
      end
    end
    array.join
  end

  private

  def modInverse
    for x in 1..@@M
      return x if ((@a % @@M * x) % @@M == 1)
    end
  end
end
