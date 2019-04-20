function delay() {
  return new Promise(resolve => setTimeout(resolve, 1000));
}

async function delayedLog(item) {
  await delay();
  console.log(item);
}

async function processArray(array) {
  // map array to promises
  const promises = array.map(delayedLog);
  // wait until all promises are resolved
  await Promise.all(promises);
  console.log('Done!');
}

processArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
