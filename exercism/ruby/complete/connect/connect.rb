class Board
  def initialize(board)
    @board = board.map{ |row| row.strip.scan(/[.OX]/) }
    @end_row = @board.length - 1
    @end_column = @board[0].length - 1
  end

  def winner # X goes left to right, O goes top down
    output = ''
    return output if @board.empty?

    @board.each_with_index do |row, index|
      if row[0] == 'X'
        output = 'X' if bfs(index, 0, 'X')
      end
    end

    @board[0].each_with_index do |value, column|
      if value == 'O'
        output = 'O' if bfs(0, column, 'O')
      end
    end

    output
  end

  private

  def bfs(row, column, value, visited = [], queue = [])
    return true if (value == 'X' && column == @end_column) || (value == 'O' && row == @end_row)
    visited << [row, column]
    adjacent = [[-1,1],[-1,0],[0,1],[0,-1],[1,0],[1,-1]]
    adjacent.each do |dy, dx|
      new_row = row + dy
      new_column = column + dx
      if new_row >= 0 && new_row <= @end_row && new_column >= 0 && new_column <= @end_column
        if @board[new_row][new_column] == value && !visited.include?([new_row, new_column])
          queue << [new_row, new_column] unless queue.include?([new_row, new_column])
        end
      end
    end
    coordinates = queue.shift
    bfs(coordinates[0], coordinates[1], value, visited, queue) if coordinates
  end
end
