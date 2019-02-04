class ETL
  def self.transform(data)
    output = {}
    data.each{ |k, v| v.each{ |letter| output[letter.downcase] = k } }
    output
  end
end
