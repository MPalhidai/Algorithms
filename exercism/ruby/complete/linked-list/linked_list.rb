class Node
  attr_accessor :data, :previous, :next

  def initialize(data)
    @data = data
    @previous = nil
    @next = nil
  end
end

class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
    new_node = Node.new(data)
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      new_node.previous = @tail
      @tail = new_node
    end
    new_node
  end

  def pop
    output = @tail.data
    unless @tail.previous.nil?
      @tail = @tail.previous
      @tail.next = nil
    else
      @head = nil
      @tail = nil
    end
    output
  end

  def shift
    output = @head.data
    unless @head.next.nil?
      @head = @head.next
      @head.previous = nil
    else
      @head = nil
      @tail = nil
    end
    output
  end

  def unshift(data)
    new_node = Node.new(data)
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    else
      @head.previous = new_node
      new_node.next = @head
      @head = new_node
    end
    new_node
  end
end
