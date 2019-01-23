class HighScores
  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def latest
    @scores[-1]
  end

  def personal_best
    @scores.max
  end

  def personal_top
    @scores.sort.last(3).reverse
  end

  def report
    output = "Your latest score was #{latest}. "
    if difference == 0
      output += "That's your personal best!"
    else
      output += "That's #{difference} short of your personal best!"
    end
  end

  private

  def difference
    personal_best - latest
  end
end
