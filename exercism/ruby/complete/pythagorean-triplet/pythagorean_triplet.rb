class Triplet
  def initialize(*args)
    raise ArgumentError if args.length != 3
    @triangle = args.sort
  end

  def sum
    @triangle.sum
  end

  def product
    @triangle.reduce(:*)
  end

  def pythagorean?
    @triangle[0] ** 2 + @triangle[1] ** 2 == @triangle[2] ** 2 && @triangle[0] < @triangle[1] && @triangle[1] < @triangle[2]
  end

  def self.where(args)
    @possible = []
    args[:min_factor] ? min = args[:min_factor] : min = 1
    args[:sum] ? sum = args[:sum] : sum = 1
    find(min, args[:max_factor], sum)
    @possible
  end

  private

  def self.find(min, max, sum) # refactor for speed
    (min...max-1).each do |a|
      (a+1...max).each do |b|
        (b+1..max).each do |c|
          tri = Triplet.new(a,b,c)
          if tri.pythagorean?
            if sum == 1
              @possible << tri
            else
              @possible << tri if tri.sum == sum
            end
          end
        end
      end
    end
  end
end
