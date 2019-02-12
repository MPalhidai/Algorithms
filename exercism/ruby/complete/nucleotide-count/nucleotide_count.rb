class Nucleotide

  class << self
    alias_method :from_dna, :new
  end

  def initialize(strand)
    @count = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
    strand.chars.each do |letter|
      raise ArgumentError if @count[letter].nil?
      @count[letter] += 1
    end
  end

  def count(nucleotide)
    @count[nucleotide]
  end

  def histogram
    @count
  end
end
