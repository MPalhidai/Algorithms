class Garden

  @@seeds = {
    "V" => :violets,
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass
  }

  def initialize(string, kids = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry))
    students = []
    kids.sort.each do |name|
      students << instance_variable_set("@#{name.downcase!}", [])
      self.class_eval("attr_reader :#{name}")
    end

    string.split("\n").each do |row|
      x = 0
      for i in 0...row.length
        x += 1 if i % 2 == 0 unless i == 0
        students[x] << @@seeds[row[i]]
      end
    end

  end
end
