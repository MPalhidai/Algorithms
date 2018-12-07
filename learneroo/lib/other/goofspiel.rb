class Game
  def initialize(bids = [])
    @bids = bids
  end

  def playGame
    playerOneBids = []
    playerTwoBids = []
    @bids.each_slice(2) do |left, right|
      playerOneBids << left
      playerTwoBids << right
    end

    turn = 1
    score = (1..13).reduce(:+)
    playerOneScore = score
    playerTwoScore = score
    until playerOneBids.empty? && playerTwoBids.empty?

      playerOne = playerOneBids.shift
      playerOneScore -= playerOne
      playerTwo = playerTwoBids.shift
      playerTwoScore -= playerTwo
      if playerOne > playerTwo
        playerOneScore += turn
        turn += 1
      elsif playerOne < playerTwo
        playerTwoScore += turn
        turn += 1
      elsif playerOne == playerTwo
        playerOneScore += playerOne
        playerTwoScore += playerTwo
      end
    end
    print "#{playerOneScore} #{playerTwoScore}"
    puts
  end
end


tests = []
tests << [1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 1]
tests << [1, 2, 4, 3, 5, 1, 2, 6, 9, 7, 10, 1, 2, 11, 11, 4, 13, 12, 3, 10, 3, 7, 12, 13, 8, 12]
tests << [2, 1, 3, 2, 4, 3, 5, 5, 6, 4, 1, 5, 7, 6, 8, 7, 9, 8, 10, 9, 11, 11, 12, 12, 13, 13, 1, 10, 12, 11, 13, 12, 5, 13]


tests.each{ |try| Game.new(try).playGame }
