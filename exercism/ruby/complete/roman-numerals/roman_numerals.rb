class Integer
  def to_roman
    roman_string = ""
    num = self
    numerals = {1=>'I',5=>'V',10=>'X',50=>'L',100=>'C',500=>'D',1000=>'M'}
    numerals.sort_by{|k,v|-k}.each do |number, letter|
      if num >= number
        roman_string += letter * (num / number)
        num %= number
      elsif num >= number - number / 10 && number.to_s[0] == '1'
        roman_string += numerals[number/10] + letter
        num -= number - number/10
      elsif num >= number - number / 5 && number.to_s[0] == '5'
        roman_string += numerals[number/5] + letter
        num -= number - number/5
      end
    end
    roman_string
  end
end
