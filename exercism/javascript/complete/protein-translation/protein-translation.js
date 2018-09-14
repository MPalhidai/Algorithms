const protein_codons = {
  "Methionine":["AUG"],
  "Phenylalanine":["UUU","UUC"],
  "Leucine":["UUA","UUG"],
  "Serine":["UCU","UCC","UCA","UCG"],
  "Tyrosine":["UAU","UAC"],
  "Cysteine":["UGU","UGC"],
  "Tryptophan":["UGG"],
  "STOP":["UAA","UAG","UGA"]
}

const translate = (rna) => {
  let transcriptase = [];
  if (rna == undefined) return transcriptase;
  if (rna.match(/[^ACGU]/)) throw (new Error('Invalid codon'));
  for(let i = 0; i < rna.length; i += 3) {
    let codon = rna[i] + rna[i+1] + rna[i+2];
    for (let protein in protein_codons) {
      protein_codons[protein].forEach((triplets) => {
        if (codon == triplets && protein == "STOP") {
          i += rna.length;
        } else if (codon == triplets) {
          transcriptase.push(protein);
        }
      })
    }
  }
  return transcriptase;
}

export default translate;
