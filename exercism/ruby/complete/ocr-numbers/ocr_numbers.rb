class OcrNumbers
  @@QCR = {
      " _ | ||_|   " => "0",
      "     |  |   " => "1",
      " _  _||_    " => "2",
      " _  _| _|   " => "3",
      "   |_|  |   " => "4",
      " _ |_  _|   " => "5",
      " _ |_ |_|   " => "6",
      " _   |  |   " => "7",
      " _ |_||_|   " => "8",
      " _ |_| _|   " => "9"
    }

  def self.convert(input)
    array = input.split("\n")
    raise ArgumentError if array.length % 4 != 0 || array[0].length % 3 != 0
    output = ""

    number_rows = []

    array.each_slice(4) do |row|
      numbers = []
      row.each do |number_row|
        i = 0
        number_row.chars.each_slice(3) do |slice|
          numbers[i] ? numbers[i] << slice : numbers[i] = [slice]
          i += 1
        end
      end
      number_rows << numbers
    end

    number_rows.each do |row|
      row.each do |num|
        string = num.join
        @@QCR[string] ? output += @@QCR[string] : output += "?"
      end
      output += ','
    end

    output[0...-1]
  end
end
