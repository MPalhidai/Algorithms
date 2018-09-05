// Given a number n, return the number of steps required to reach 1.
// loop if n is odd n = 3n+1 if n is even n = n / 2

const steps = (n) => {
  if (n <= 0) throw(new Error('Only positive numbers are allowed'));
  let step = 0
  while (n != 1) {
    if (n % 2 == 0) {
      n = n / 2;
    } else {
      n = 3 * n + 1;
    }
    step++;
  }
  return step;
}

export { steps };
