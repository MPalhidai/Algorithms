export default function hamming() {
  return {
    compute: function(strand_one, strand_two) {
      if (strand_one.length != strand_two.length) {
        throw new Error('DNA strands must be of equal length.');
      } else {
        let hamming_distance = 0;
        for(let i=0; i<strand_one.length; i++) {
          if (strand_one[i] != strand_two[i]) hamming_distance++;
        }
        return hamming_distance;
      }
    }
  }
}
