class SecretHandshake
  @@secrets = {
    'wink': 0b1,
    'double blink': 0b10,
    'close your eyes': 0b100,
    'jump': 0b1000,
    'reverse': 0b10000
  }

  def initialize decimal
    @decimal = decimal
  end

  def commands
    output = []
    return output unless @decimal.is_a? Integer
    @@secrets.each do |key, binary|
      if @decimal & binary == binary
        if binary == 0b10000
          output.reverse!
        else
          output << key.to_s
          @decimal ^= binary
        end
      end
    end
    output
  end
end
