class PhoneNumber {
  constructor(digits) {
    this.digits = digits;
  }

  number() {
    let numbers = this.digits.match(/[0-9]/g);
    if (this.digits.match(/[a-z]/i)) {
      return null;
    } else if (numbers.length === 10) {
      return numbers.join('');
    } else if (numbers[0] == 1 && numbers.length === 11) {
      return numbers.slice(1).join('');
    } else {
      return null;
    }
  }
}

export default PhoneNumber;
