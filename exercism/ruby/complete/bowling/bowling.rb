class Game

  class BowlingError < StandardError; end

  def initialize
    @frames = Hash.new(0)
    @frame = 1
    @rolls = 0
    @counter = 0
    @max_rolls = 21
    @strikes = {}
    @spares = {}
    @tenth = []
  end

  def roll(pins)
    raise BowlingError, 'How do you bowl negative pins?' if pins < 0
    raise BowlingError, 'Where did extra pins come from?' if pins > 10
    raise BowlingError, 'Game already ended.' if @counter >= @max_rolls
    @rolls += 1
    @counter += 1
    bonus(@counter, pins)
    @frames[@frame] += pins
    if @frame < 10
      raise BowlingError, 'Where did extra pins come from?' if @frames[@frame] > 10
      if pins == 10
        @strikes[@frame] = @counter
        @frame += 1
        @rolls = 0
      elsif pins < 10
        if @rolls == 2
          @spares[@frame] = @counter if @frames[@frame] == 10
          @frame += 1
          @rolls = 0
        end
      end
    elsif @frame == 10
      @tenth << pins
      raise BowlingError, 'Where did extra pins come from?' if (@rolls == 2 && @tenth[0] < 10 && @tenth.sum > 10) || (@rolls == 3 && @tenth[1] < 10 && @tenth.sum > 20)
      if @frames[@frame] == 10 && @rolls <= 2
        add_rolls = 1
        add_rolls += 1 if @rolls == 1
        @max_rolls = @counter + add_rolls
      elsif @rolls == 2 && @frames[@frame] < 10
        @max_rolls = @counter
      end
    end
  end

  def score
    raise BowlingError, 'Game in progress.' if @counter < @max_rolls
    raise BowlingError, 'Game already ended.' if @counter > @max_rolls
    @frames.values.sum
  end

  private

  def bonus(roll, add)
    @strikes.each{|k,v| @frames[k] += add if roll - v <= 2}
    @spares.each{|k,v| @frames[k] += add if roll - v <= 1}
  end
end
