class Array
  def accumulate
    self.reduce([]){|acc, el| acc << yield(el)}
  end
end
