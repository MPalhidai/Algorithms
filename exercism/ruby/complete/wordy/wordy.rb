class WordProblem
  @@math = {
    plus: :+,
    minus: :-,
    multiplied: :*,
    divided: :/
  }

  def initialize(string)
    @equation = []
    question = string[0...-1]
    question.split(' ').each do |word|
      if @@math[word.to_sym]
        @equation << @@math[word.to_sym]
      elsif /^\-?[1-9]\d*(\.\d*)?$/.match(word)
        @equation << word.to_i
      end
    end
  end

  def answer
    raise ArgumentError if @equation.none?{ |element| @@math.values.include?(element) }
    total = @equation[0]
    i = 1
    while i < @equation.length
      evaluate = total.method(@equation[i])
      i += 1
      total = evaluate.call(@equation[i])
      i += 1
    end
    total
  end
end
