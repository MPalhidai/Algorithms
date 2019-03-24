class Transpose
  def self.transpose(string)
    transposed = string.split("\n").map{ |row| row.chars }.transpose

    transposed.map do |row|
      row.join
    end.join("\n")
  end
end
