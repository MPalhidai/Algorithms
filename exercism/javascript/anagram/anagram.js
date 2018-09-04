// refactor to use hash map solution

class Anagram {
  constructor(word) {
    this.word = word;
  }

  matches(arr) {
    let anagrams = [];
    let index = 0;
    if (this.word.match(/[A-Z]/g) != null && this.word.match(/[A-Z]/g).length > 1) return anagrams;
    let match = this.word.toLowerCase().split('').sort();
    while (index < arr.length) {
      let text = arr[index].toLowerCase().split('').sort();
      let wrong = 0;
      if (text.length == match.length) {
        for (let i=0; i<match.length; i++) {
          if (text[i] != match[i]) {
            wrong++;
          }
        }
      } else {
        wrong = text.length - match.length;
      }
      if (wrong == 0) {
        anagrams.push(arr[index]);
      }
      index++;
    }
    return anagrams;
  }
}

export default Anagram;
