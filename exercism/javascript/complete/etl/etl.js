// I think I just need to switch keys for values

const transform = (old) => {
  let newHash = {};
  for (let oldKey in old) {
    old[oldKey].forEach((oldValue) => {
      newHash[oldValue.toLowerCase()] = Number(oldKey);
    })
  }
  return newHash;
}


export default transform;
