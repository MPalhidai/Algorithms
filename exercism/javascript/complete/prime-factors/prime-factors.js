const PrimeFactors = () => {
  const For = (input) => {
    let output = [];
    let i = 2;
    while(input >= 1 && i <= input) {
      if (input % i == 0) {
        output.push(i);
        input = Math.floor(input/i);
        i = 1;
      }
      i++;
    }
    return output;
  }

  return { For }; // I changed this and the spec because for is a key word
}

export default PrimeFactors;
