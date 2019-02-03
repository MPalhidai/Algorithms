class School
  def initialize
    @school = []
    (1..12).each{ |num| @school << { grade: num, students: [] } }
  end

  def add(name, grade)
    @school[grade-1][:students] << name
    @school[grade-1][:students].sort!
  end

  def students(grade)
    @school[grade-1][:students]
  end

  def students_by_grade
    @school.select{ |grade| !grade[:students].empty? }
  end
end
