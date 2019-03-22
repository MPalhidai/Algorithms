class CustomSet < Array
  def initialize(set)
    set.each{ |element| self << element }
    self.sort!
  end

  def member?(element)
    self.include?(element)
  end

  def subset?(set)
    if !self.empty? && !set.empty?
      self.all?{|element| set.member?(element) }
    elsif !self.empty? && set.empty?
      false
    elsif self.empty?
      true
    end
  end

  def disjoint?(set)
    self.none?{|element| set.member?(element) }
  end

  def add(element)
    unless self.member?(element)
      self << element
      self.sort!
    else
      self
    end
  end

  def intersection(set)
    output = []
    set.each{ |element| output << element if self.member?(element) }
    output
  end

  def difference(set)
    self - set
  end

  def union(set)
    set.each{ |element| self.add(element) }
    self
  end
end
