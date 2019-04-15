class Node
  attr_accessor :value, :left, :right

  def initialize(value, left, right)
    @value = value
    @left = left
    @right = right
  end

  def ==(node)
    @value == node.value && @left == node.left && @right == node.right
  end
end

class Zipper

  attr_reader :focus

  private_class_method :new

  def initialize(tree)
    @tree = tree
    @focus = tree
    @parents = []
  end

  def self.from_tree(tree)
    new(tree)
  end

  def to_tree
    @tree
  end

  def left
    @parents << @focus
    @focus = @focus.left
    @focus ? self : nil
  end

  def right
    @parents << @focus
    @focus = @focus.right
    @focus ? self : nil
  end

  def up
    return if @parents.empty?
    @focus = @parents.pop
    self
  end

  def value
    @focus.value
  end

  def set_value(data)
    @focus.value = data
    self
  end

  def set_left(node)
    @focus.left = node
    self
  end

  def set_right(node)
    @focus.right = node
    self
  end

  def ==(other)
    @focus == other.focus
  end
end
