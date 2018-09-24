const USED_NAMES = {};
const LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const NUMBERS = "0123456789";

class Robot {
  constructor() {
    this.name = generateName();
  };

  reset() {
    this.name = generateName();
  }
};

const generateName = () => {
  let newName = "";
  for (let i = 0; i < 5; i++) {
    if (i < 2) {
      newName += LETTERS.charAt(Math.floor(Math.random() * LETTERS.length));
    } else {
      newName += NUMBERS.charAt(Math.floor(Math.random() * NUMBERS.length));
    }
  };
  USED_NAMES[newName] ? generateName() : USED_NAMES[newName] = "In Use";
  return newName;
};

export default Robot;
