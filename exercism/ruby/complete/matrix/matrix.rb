class Matrix
  def initialize(string)
    @input = string
  end

  def rows
    @input.split(/\n/).map{ |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
