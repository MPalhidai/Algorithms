class Say
  @@NUMBERS = {
    1_000_000_000 => 'billion',
    1_000_000 => 'million',
    1000 => 'thousand',
    100 => 'hundred',
    90 => 'ninety',
    80 => 'eighty',
    70 => 'seventy',
    60 => 'sixty',
    50 => 'fifty',
    40 => 'forty',
    30 => 'thirty',
    20 => 'twenty',
    19 => 'nineteen',
    18 => 'eighteen',
    17 => 'seventeen',
    16 => 'sixteen',
    15 => 'fifteen',
    14 => 'fourteen',
    13 => 'thirteen',
    12 => 'twelve',
    11 => 'eleven',
    10 => 'ten',
    9 => 'nine',
    8 => 'eight',
    7 => 'seven',
    6 => 'six',
    5 => 'five',
    4 => 'four',
    3 => 'three',
    2 => 'two',
    1 => 'one'
  }

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError if @number < 0 || @number > 999_999_999_999
    return "zero" if @number == 0
    to_english(@number)
  end

  private

  def to_english(int)
    str = ""
    @@NUMBERS.each do |num, name|
      if int == 0
        return ""
      elsif int.to_s.length == 1 && int / num > 0
        return str + "#{name}"
      elsif int < 100 && int / num > 0
        return str + "#{name}" if int % num == 0
        return str + "#{name}-" + to_english(int % num)
      elsif int / num > 0
        return (str + to_english(int/num) + " #{name} " + to_english(int%num)).strip
      end
    end
  end
end
