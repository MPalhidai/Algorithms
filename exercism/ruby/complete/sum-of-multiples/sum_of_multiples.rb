class SumOfMultiples
  def initialize(*args)
    @multiples = args
  end

  def to(top)
    return 0 if @multiples.any?{ |mult| mult == 0 }
    (1...top).reduce(0){ |acc, i| @multiples.any?{ |mult| i % mult == 0 } ? acc + i : acc }
  end
end
