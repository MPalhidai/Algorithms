class Brackets
  def self.paired?(s)
    stack = []
    mapping = { ")" => "(", "}" => "{", "]" => "[" }
    s.chars.each do |char|
      if mapping[char]
          top_element = stack.pop
          return false if mapping[char] != top_element
      elsif mapping.values.include?(char)
        stack << char
      end
    end
    stack.empty?
  end
end
