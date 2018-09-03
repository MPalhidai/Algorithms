class Isogram {
  constructor(text) {
    this.text = text;
  }

  isIsogram() {

    if (this.text === '') return true;
    let hash = {};
    let regSelect = this.text.toLowerCase().match(/[a-z]/gi);

    for (let i = 0; i < regSelect.length; i++) {
      hash[regSelect[i]] === undefined ? hash[regSelect[i]] = 1 : hash[regSelect[i]]++;
    }

    return Object.keys(hash).every((key) => hash[key] === 1);
  }
}

export default Isogram;
