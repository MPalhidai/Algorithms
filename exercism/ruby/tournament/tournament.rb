class Tournament
  @@header = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    @games = {}
    input.split("\n").each do |game|
      game.split(";").each_slice(3) do |home, away, result|
        @games[home] = { MP: 0, W: 0, D: 0, L: 0, P: 0 } if @games[home].nil?
        @games[away] = { MP: 0, W: 0, D: 0, L: 0, P: 0 } if @games[away].nil?
        @games[home][:MP] += 1
        @games[away][:MP] += 1
        if result == "win"
          @games[home][:W] += 1
          @games[home][:P] += 3
          @games[away][:L] += 1
        elsif result == 'loss'
          @games[away][:W] += 1
          @games[away][:P] += 3
          @games[home][:L] += 1
        elsif result == 'draw'
          @games[home][:D] += 1
          @games[away][:D] += 1
          @games[home][:P] += 1
          @games[away][:P] += 1
        end
      end
    end
    scoreboard
  end

  private

  def self.scoreboard
    return @@header if @games.empty?
    @output = @@header
    @games.sort_by{|k, v| k}.sort_by{|k,v| -v[:P]}.each do |team|
      space = ' ' * (31 - team[0].length)
      @output += "#{team[0]}#{space}|  #{team[1][:MP]} |  #{team[1][:W]} |  #{team[1][:D]} |  #{team[1][:L]} |  #{team[1][:P]}\n"
    end
    @output
  end
end
