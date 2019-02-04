class Array
  def keep
    self.map{|el| el if yield(el)}.compact
  end

  def discard
    self.map{|el| el unless yield(el)}.compact
  end
end
