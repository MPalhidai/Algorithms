class Dominoes
  def self.chain?(dominoes)
    return true if dominoes.empty?
    dominoes.permutation.to_a.any? do |configuration|
      temp = true
      for i in 0...configuration.length
        if configuration[i-1][1] != configuration[i][0]
          configuration[i] = configuration[i].reverse!
          if configuration[i-1][1] != configuration[i][0]
            temp = false
            break
          end
        end
      end
      return temp if temp
    end
  end
end
