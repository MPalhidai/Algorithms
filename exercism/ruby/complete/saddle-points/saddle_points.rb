class Matrix
  def initialize(string)
    @matrix = string_to_matrix(string)
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end

  def saddle_points
    output = []
    for x in 0...@matrix.length
      for y in 0...@matrix[x].length
        output << [x, y] if @matrix[x][y] == rows[x].max && @matrix[x][y] == columns[y].min
      end
    end
    output
  end

  private

  def string_to_matrix(s)
    s.split("\n").map{ |row| row.split(' ').map(&:to_i) }
  end
end
