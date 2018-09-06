// counter hash split on whitespaces toLowerCase the keys
const Words = () => {
  const count = (sentence) => {
    let hash = {};
    let array = sentence.split(/\s+/);
    for (let i = 0; i < array.length; i++) {
      if (array[i] == '') {
        continue;
      } else if (typeof(hash[array[i].toLowerCase()]) != "number") {
        hash[array[i].toLowerCase()] = 1;
      } else {
        hash[array[i].toLowerCase()]++;
      }
    }
    return hash;
  }
  return { count };
}

export default Words;
