const transpose = (input) => {
  if (input == []) return input;

  let words = input;
  let output = [];
  for (let c_idx = 0; ; c_idx++) {
    let line = [];
    let done = true;
    for (let w_idx = 0; w_idx < words.length; w_idx++) {
      if (c_idx < words[w_idx].length) {
        done = false;
        line.push(words[w_idx].charAt(c_idx));
      } else {
        line.push(' ');
      }
    }
    if (done) {
      break;
    } else {
      output.push(line.join(''));
    }
  }

  if (output[output.length - 1] != undefined && output[output.length - 1][output[output.length - 1].length - 1] == " ") {
    let i = output[output.length - 1].indexOf(".");
    if (i == -1) i = output[output.length - 1].indexOf(",");
    output[output.length - 1] = output[output.length - 1].slice(0,i+1);
  }
  return output;
}

export default transpose;
