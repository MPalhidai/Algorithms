class Crypto
  def initialize(plaintext)
    @input = plaintext
  end

  def ciphertext
    array = @input.scan(/[a-z0-9]/i)
    n = (array.length ** 0.5).ceil
    return @input if n == 0
    output = []
    array.each_slice(n) do |slice|
      while slice.length < n
        slice << ' '
      end
      output << slice
    end
    output.transpose.map{ |row| row.join.downcase }.join(' ')
  end
end
