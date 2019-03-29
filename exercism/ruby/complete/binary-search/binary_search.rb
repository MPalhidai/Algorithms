class BinarySearch
  attr_reader :list

  def initialize(array)
    @list = array
    for i in 1...@list.length
      raise ArgumentError if @list[i-1] > @list[i]
    end
  end

  def search_for(find_value, index = middle, l_index = 0, r_index = @list.length - 1)
    raise RuntimeError if l_index >= r_index
    if @list[index] == find_value
      return index
    elsif @list[index] < find_value
      l_index = index + 1
      search_for(find_value, middle(l_index, r_index), l_index, r_index)
    else
      r_index = index - 1
      search_for(find_value, middle(l_index, r_index), l_index, r_index)
    end
  end

  def middle(start_index = 0, end_index = @list.length - 1)
    (start_index + end_index) / 2
  end
end
