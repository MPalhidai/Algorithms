require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @date = Date.new(@year, @month, 1)
  end

  def day(*args)
    find_day_of_week(args.first)
    find_week_of_month(args.last)
    @date
  end

  private

  def find_day_of_week(symbol)
    case symbol
    when :monday
      return if @date.monday?
    when :tuesday
      return if @date.tuesday?
    when :wednesday
      return if @date.wednesday?
    when :thursday
      return if @date.thursday?
    when :friday
      return if @date.friday?
    when :saturday
      return if @date.saturday?
    when :sunday
      return if @date.sunday?
    else
      raise TypeError
    end
    @date = @date.next
    find_day_of_week(symbol)
  end

  def find_week_of_month(symbol, count = 0)
    count += 1
    case symbol
    when :first
      return if count == 1
    when :second
      return if count == 2
    when :teenth
      return if @date.mday > 12 && @date.mday < 20
    when :third
      return if count == 3
    when :fourth
      return if count == 4
    when :last
      if @date.mon != @month
        @date = @date.next_day(-7)
        return
      end
    else
      raise TypeError
    end
    @date = @date.next_day(7)
    find_week_of_month(symbol, count)
  end
end
