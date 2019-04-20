const job1 = res => setTimeout(() => res('first'), 1000);
const job2 = res => setTimeout(() => res('second'), 1200);
const job3 = res => setTimeout(() => res('third'), 800);

const jobs = [job1, job2, job3];

const callback = results => console.log(results);

async function asyncMap(array, puts) {
  for (let i = 0; i < array.length; i += 1) {
    await new Promise(array[i]).then(result => puts(result));
  }
  console.log('Done!');
}

asyncMap(jobs, callback); // process one at a time
