
const encode = (text) => {
  if (text == '') return text;
  let arr = text.split('');
  let index = 0;
  let compression = "";
  while (index < arr.length) {
    let count = 0;
    let i = index;
    while (arr[index] == arr[i]) {
      if (arr[index] == arr[i]) count++;
      i++;
    }
    if (count == 1) {
      compression += `${arr[index]}`;
    } else {
      compression += `${count}${arr[index]}`;
    }
    index += count;
  }
  return compression
}

const decode = (data) => {
  if (data == '') return data;
  let arr = data.split('');
  let index = 0;
  let text = "";
  let numbers = "";
  while (index < arr.length) {
    if (/[0-9]/.test(Number(arr[index])) && arr[index] != ' ') {
      numbers += `${arr[index]}`;
    } else if (numbers != "") {
      text += `${arr[index].repeat(Number(numbers))}`;
      numbers = "";
    } else {
      text += `${arr[index]}`;
    }
    index++;
  }

  return text;
}

export { encode, decode };
