class InvalidCodonError < ArgumentError
end

class Translation
  @@transcriptase = {
    Methionine: %w(AUG),
    Phenylalanine: %w(UUU UUC),
    Leucine: %w(UUA UUG),
    Serine: %w(UCU UCC UCA UCG),
    Tyrosine: %w(UAU UAC),
    Cysteine: %w(UGU UGC),
    Tryptophan: %w(UGG),
    STOP: %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    @@transcriptase.each{ |key, value| return key.to_s if value.include?(codon) }
    false
  end

  def self.of_rna(strand)
    output = []
    i = 0
    while i < strand.length
      protein = self.of_codon(strand[i...i+3])
      break if protein == "STOP"
      raise InvalidCodonError unless protein
      output << protein
      i += 3
    end
    output
  end
end
