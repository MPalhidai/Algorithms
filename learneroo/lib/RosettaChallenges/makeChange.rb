def makeChange(total)
  count = 0
  for penny in (0..total)
    for nickel in (0..total/5)
      for dime in (0..total/10)
        for quarter in (0..total/25)
          count += 1 if penny * 1 + nickel * 5 + dime * 10 + quarter * 25 == total
        end
      end
    end
  end
  count
end

input = [15, 25, 42, 52]
input.each{ |try| puts makeChange(try) }
