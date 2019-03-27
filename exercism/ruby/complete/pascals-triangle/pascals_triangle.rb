class Triangle
  attr_reader :rows

  def initialize(level)
    @rows = [[1]]
    for i in 1...level
      row = []
      n = @rows[i-1].length
      for j in 0..n
        if j == n
          row << @rows[i-1][j-1]
        elsif j == 0
          row << @rows[i-1][j]
        else
          row << @rows[i-1][j-1] + @rows[i-1][j]
        end
      end
      @rows << row
    end
  end
end
