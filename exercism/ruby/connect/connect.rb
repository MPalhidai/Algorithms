class Board
  def initialize(board)
    @board = board.map{ |row| row.strip.scan(/[.OX]/) }
    @size = @board.length - 1
  end

  def winner # X goes left to right, O goes top down
    output = ''
    return output if @size < 0

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
    # if it is connected more than once, it can choose the wrong path and get stuck

    return true if (value == 'X' && column == @size) || (value == 'O' && row == @size)
    visited << [row, column]
    adjacent = [[-1,1],[-1,0],[0,1],[-1,0],[1,0],[1,-1]]
    adjacent.each do |dy, dx|
      new_row = row + dy
      new_column = column + dx
      if new_row >= 0 && new_row <= @size && new_column >= 0 && new_column <= @size
        if @board[new_row][new_column] == value && !visited.include?([new_row, new_column])
          queue << [new_row, new_column]
        end
      end
    end
    coordinates = queue.pop
    bfs(coordinates[0], coordinates[1], value, visited, queue) if coordinates
  end
end
