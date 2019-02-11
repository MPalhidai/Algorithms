class Alphametics
  def self.solve(puzzle)
    output = {}
    chars = []
    syms = []
    sub = []
    for i in 0..puzzle.length
      if /[A-Z\=]/.match(puzzle[i])
        output[puzzle[i]] = 0 if puzzle[i] != '='
        sub << puzzle[i]
      elsif /[\*\/\+\-]/.match(puzzle[i])
        syms << puzzle[i].to_sym
      elsif !sub.empty? && sub[0] != '='
        chars << sub
        sub = []
      elsif !sub.empty?
        syms << sub.join.to_sym
        sub = []
      end
    end

    equation = chars.zip(syms).flatten.compact
    permutation = (0..9).to_a.permutation(output.length).to_a

    permutation.each do |values|
      output.each{ |k, v| output[k] = values.shift }
      numbers = []
      a = ''
      chars.each do |arrays|
        a = arrays.map{ |letter| output[letter] }.join
        break if a[0] == '0'
        numbers << a.to_i
      end
      next if a[0] == '0'
      return output if numbers[0...-1].sum == numbers[-1]
    end
    output = {}
  end
end
