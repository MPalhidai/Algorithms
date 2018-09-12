const Series = (str) => {
  const digits = str.split("").map((x) => Number(x));
  const slices = (size) => {
    if (size > digits.length) throw(new Error('Slice size is too big.'));
    let sliced = [];
    for (let i = 0; i < digits.length; i++) {
      if (i + size > digits.length) break;
      sliced.push(digits.slice(i,i+size));
    }
    return sliced;
  }
  return { digits, slices }
}

export default Series;
