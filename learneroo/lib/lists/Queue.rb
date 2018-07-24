module LinkedList
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end

  class Queue
    def initialize
      @first = nil
      @last = nil
    end

    def enqueue(value)
      @first == nil ? @first = Node.new(value, @last) : @last = Node.new(value, @last)
      #not working
    end
    alias_method :"<<", :enqueue

    def dequeue
      raise "Queue is empty" if is_empty?
      value = @first.value
      @first = @first.next_node
      value
    end

    def is_empty?
      @first.nil?
    end
  end
end

#Use ruby stack = LinkedList::Queue.new
