class Proverb
  def initialize(*args)
    @proverbs = args
    if @proverbs[-1].is_a? Hash
      @qualifier = @proverbs[-1][:qualifier]
      @proverbs.pop
    end
  end

  def to_s
    output = []
    n = @proverbs.length
    for i in 1..n
      if i == n
        line = ''
        line += @qualifier + ' ' if @qualifier
        line += @proverbs[0]
        output << "And all for the want of a #{line}."
      else
        output << "For want of a #{@proverbs[i-1]} the #{@proverbs[i]} was lost."
      end
    end
    output.join("\n")
  end
end
