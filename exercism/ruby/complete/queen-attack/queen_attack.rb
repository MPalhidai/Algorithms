class Queens
  def initialize(args)
    @queenW = args[:white] if args[:white] && valid?(args[:white])
    @queenB = args[:black] if args[:black] && valid?(args[:black])
  end

  def attack?
    output = false
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[1,-1],[-1,1]].each do |dc, dr|
      nc = @queenW.first + dc
      nr = @queenW.last + dr
      while [nc, nr].all?{ |position| position < 8 && position >= 0 }
        output = true if [nc, nr] == @queenB
        nc += dc
        nr += dr
      end
    end
    output
  end

  private

  def valid?(input)
    if input.all?{ |position| position < 8 && position >= 0 }
      true
    else
      raise ArgumentError
    end
  end
end
