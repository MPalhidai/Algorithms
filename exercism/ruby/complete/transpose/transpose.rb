class Transpose
  def self.transpose(string)
    rows = string.split("\n")
    max_length = rows.map{ |row| row.length }.max
    transposed = {}
    rows.each do |row|
      for i in 0...max_length
        row[i].nil? ? char = ' ' : char = row[i]
        transposed[i].nil? ? transposed[i] = [char] : transposed[i] << char
      end
    end

    transposed.values.map{ |row| row.join.rstrip }.join("\n")
  end
end
