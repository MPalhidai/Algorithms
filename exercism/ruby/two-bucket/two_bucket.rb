class TwoBucket
  attr_reader :moves

  def initialize(smaller, larger, goal, turn)
    @goal = goal
    @turn = turn
    @moves = 0
    @buckets = {
      "one" => { amount: 0, max: smaller },
      "two" => { amount: 0, max: larger }
    }
    evaluate
  end

  def other_bucket
    @buckets[other][:amount]
  end

  def goal_bucket
    @turn
  end

  private

  def evaluate
    if @buckets[@turn][:max] == @goal
      fill(@turn)
      return
    elsif @buckets[other][:max] == @goal
      fill(@turn)
      fill(other)
      @turn = other
      return
    end

    until solved?
      if @buckets[other][:amount] == @buckets[other][:max]
        empty(other)
      elsif @buckets[@turn][:amount].positive?
        transfer(@turn, other)
      else
        fill(@turn)
      end
    end
  end

  def fill(bucket)
    @moves += 1
    @buckets[bucket][:amount] = @buckets[bucket][:max]
  end

  def transfer(from, to)
    @moves += 1
    amount = [@buckets[from][:amount], @buckets[to][:max] - @buckets[to][:amount]].min
    @buckets[to][:amount] += amount
    @buckets[from][:amount] -= amount
  end

  def empty(bucket)
    @moves += 1
    @buckets[bucket][:amount] = 0
  end

  def other
    @turn == "one" ? "two" : "one"
  end

  def solved?
    @buckets.values.any?{ |bucket| bucket[:amount] == @goal }
  end
end
