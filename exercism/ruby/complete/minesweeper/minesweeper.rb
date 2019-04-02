class Board
  def self.transform(game)
    @game = game
    raise ArgumentError unless valid?
    for row in 0...@game.length
      for column in 0...@game[row].length
        if @game[row][column] == ' '
          insert = count_mines(row, column)
          @game[row][column] = insert.to_s if insert > 0
        end
      end
    end
    @game
  end

  private

  def self.count_mines(row, column)
    count = 0
    adjacent = [[1,0],[0,1],[-1,0],[0,-1],[1,1],[1,-1],[-1,1],[-1,-1]]
    adjacent.each do |y, x|
      nr = row + y
      nc = column + x
      next if nr < 0 || nr >= @game.length || nc < 0 || nc >= @game[row].length
      count += 1 if @game[nr][nc] == '*'
    end
    count
  end

  def self.valid?
    check_length && check_char && check_board
  end

  def self.check_length
    @game.all?{ |row| row.length == @game[0].length }
  end

  def self.check_board
    n = @game.length - 1
    m = @game[0].length - 1

    corners = [[0,0],[0,m],[n,0],[n,m]]
    corners.each do |y, x|
      return false if @game[y][x] != '+'
    end

    [0, n].each do |y|
      (1...m).each do |x|
        return false if @game[y][x] != '-'
      end
    end

    (1...n).each do |y|
      [0, m].each do |x|
        return false if @game[y][x] != '|'
      end
    end

    true
  end

  def self.check_char
    acceptable = ['+','-','|','*',' ']
    @game.all?{ |row| row.chars.all?{ |element| acceptable.include?(element) } }
  end
end
