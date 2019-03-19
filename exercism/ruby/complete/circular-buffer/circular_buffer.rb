class CircularBuffer
  class BufferEmptyException < StandardError

  end

  class BufferFullException < StandardError

  end

  def initialize(size)
    @buffer = []
    size.times{ @buffer << [] }
    @write_index = 0
    @read_index = 0
    @size = size
  end

  def write(data)
    raise BufferFullException if @buffer.all?{ |element| !element.empty? }
    @buffer[@write_index] << data
    @write_index += 1
    @write_index = 0 if @write_index == @size
  end

  def write!(data)
    if @buffer.all?{ |element| !element.empty? }
      @buffer[@read_index] = [data]
      @read_index += 1
      @read_index = 0 if @read_index == @size
    else
      write(data)
    end
  end

  def read
    raise BufferEmptyException if @buffer.all?{ |element| element.empty? }
    output = @buffer[@read_index]
    @buffer[@read_index] = []
    @read_index += 1
    @read_index = 0 if @read_index == @size
    output.join
  end

  def clear
    @buffer.map!{ |element| [] }
  end
end
