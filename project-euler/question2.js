fib = [1,2];
sum = 0;

while (fib[fib.length -1] < 4000000){
  fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
}

for (j = 0; j < fib.length; j++) {
  if (fib[j] % 2 === 0){
    sum += fib[j];
  }
}

console.log(sum);