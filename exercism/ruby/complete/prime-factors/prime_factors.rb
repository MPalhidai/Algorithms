class PrimeFactors
  def self.for(num)
    output = []
    prime = 2
    while num > 1
      if num % prime == 0
        output << prime
        num /= prime
      else
        prime += 1
      end
    end
    output
  end
end
