class FlattenArray
  def self.flatten(array)
    @output = []
    recursive_flatten(array)
    @output
  end

  private

  def self.recursive_flatten(array)
    return if array.empty?
    array.each do |element|
      if element.class == Array
        recursive_flatten(element)
      else
        @output << element unless element.nil?
      end
    end
  end
end
