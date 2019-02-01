class TwelveDays
  @@days = {
    1 => ["first", "a Partridge in a Pear Tree"],
    2 => ["second", "two Turtle Doves"],
    3 => ["third", "three French Hens"],
    4 => ["fourth", "four Calling Birds"],
    5 => ["fifth", "five Gold Rings"],
    6 => ["sixth", "six Geese-a-Laying"],
    7 => ["seventh", "seven Swans-a-Swimming"],
    8 => ["eighth", "eight Maids-a-Milking"],
    9 => ["ninth", "nine Ladies Dancing"],
    10 => ["tenth", "ten Lords-a-Leaping"],
    11 => ["eleventh", "eleven Pipers Piping"],
    12 => ["twelfth", "twelve Drummers Drumming"],
  }

  def self.song
    lines = []
    for i in 1..12
      output = ["On the #{@@days[i][0]} day of Christmas my true love gave to me:"]
      while i > 0
        output << @@days[i][1]
        i -= 1
      end
      lines << combine(output)
    end
    lines.join("\n\n") + "\n"
  end

  private

  def self.combine(array)
    i = 0
    n = array.length - 1
    output = ''
    while i <= n
      if i == 0
        output += array[i]
      elsif i == 1
        output += ' ' + array[i]
        output += '.' if i == n
      elsif i == n
        output += ', and ' + array[i] + '.'
      else
        output += ', ' + array[i]
      end
      i += 1
    end
    output
  end

end
