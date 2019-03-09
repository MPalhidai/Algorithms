class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(data)
    @datum = data
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(array = [])
    @head = nil
    array.each{ |value| self.push(value) }
  end

  def push(value)
    value.is_a?(Element) ? element = value : element = Element.new(value)
    if @head
      node = @head
      until node.next.nil?
        node = node.next
      end
      node.next = element
    else
      @head = element
    end
    self
  end

  def pop
    node = @head
    if node && node.next
      until node.next.next.nil?
        node = node.next
      end
      temp = node.next
      node.next = nil
      temp
    elsif node && node.next.nil?
      @head = nil
      node
    end
  end

  def to_a
    output = []
    node = @head
    while node
      output.unshift(node.datum)
      node = node.next
    end
    output
  end

  def reverse!(old_head = @head, previous = nil)
    if old_head
      new_head = old_head.next
      old_head.next = previous
      if new_head
        reverse!(new_head, old_head)
      else
        @head = old_head
      end
    end
    self
  end
end
