class Prime
  def self.nth(num)
    raise ArgumentError if num < 1
    primes = [2,3]
    index = 5
    until primes.length >= num
      primes << index if (2..index/2).none?{ |div| index % div == 0 }
      index += 2
    end
    primes[num-1]
  end
end
