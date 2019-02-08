class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(num = nil)
    @data = num
    @left = nil
    @right = nil
  end

  def insert(num)
    if num > data
      right ? right.insert(num) : self.right = Bst.new(num)
    else
      left ? left.insert(num) : self.left = Bst.new(num)
    end
  end

  def each(&block)
    return enum_for(:each) unless block_given?
    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end
end
