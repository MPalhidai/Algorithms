class Anagram

  def initialize(word)
    letter_count = Hash.new(0)
    @word = word.downcase
    @word.chars.each{ |letter| letter_count[letter] += 1 }
    @letter_count = letter_count.sort_by{ |k,v| k }
  end

  def match(array) #return word in array that are anagrams of @letter_count
    output = []
    array.each do |word|
      hash = Hash.new(0)
      word.chars.each { |letter| hash[letter.downcase] += 1 }
      output << word if @letter_count == hash.sort_by{ |k,v| k } && word.downcase != @word
    end
    output
  end
end
