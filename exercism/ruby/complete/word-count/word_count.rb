class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    hash = Hash.new(0)
    @string.gsub(/( '|' )/, ' ').split(/[^a-zA-Z'0-9]/).each{ |word| hash[word.downcase] += 1 unless word == '' }
    hash
  end
end
