class Diamond
  def self.make_diamond(width)
    return "A\n" if width == "A"
    array = []
    sides = width.ord - 65
    ('A'..width).each_with_index do |letter, index|
      outside = ' ' * (sides - index)
      if index == 0
        array << outside + letter + outside + "\n"
      else
        inside = ' ' * (2 * index - 1)
        array << outside + letter + inside + letter + outside + "\n"
      end
    end
    (array + array[0...-1].reverse).join
  end
end
