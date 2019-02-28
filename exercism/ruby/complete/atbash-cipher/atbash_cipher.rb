class Atbash
  def self.encode(plaintext)
    plaintext.downcase.scan(/[a-z0-9]/).map do |letter|
      /[a-z]/.match(letter) ? (123 + (96 - letter.ord)).chr : letter
    end.each_slice(5).map{ |chunk| chunk.join }.join(' ')
  end
end
