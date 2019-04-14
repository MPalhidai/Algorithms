class ListOps
  def self.arrays(list)
    list.length
  end

  def self.reverser(list)
    list.reverse
  end

  def self.concatter(a, b)
    a + b
  end

  def self.mapper(list)
    list.map{ |x| yield(x) }
  end

  def self.filterer(list)
    list.select{ |x| yield(x) }
  end

  def self.sum_reducer(list)
    list.reduce(0){ |acc, x| acc + x }
  end

  def self.factorial_reducer(list)
    list.reduce(1){ |acc, x| acc * x }
  end
end
