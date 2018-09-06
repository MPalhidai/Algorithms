
// find factors including 1 but not itself, sum factors, return -1,0,1, add errors
const PerfectNumbers = () => {
  const classify = (input) => {
    if (input < 1) {
      throw(new Error('Classification is only possible for natural numbers.'));
    } else if (input == 1) {
      return "deficient";
    }
    let factors = [];
    for (let i = 1; i <= input/2; i++) {
      if (input % i == 0) {
        factors.push(i);
      }
    }
    let total = factors.reduce((sum, value) => sum + value);
    if (total == input) {
      return "perfect";
    } else if (total < input) {
      return "deficient";
    } else {
      return "abundant";
    }
  }
  return { classify }
}

export default PerfectNumbers;
