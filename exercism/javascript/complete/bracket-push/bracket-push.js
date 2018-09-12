const bracketPush = (string) => {
  for (let i=1; i<string.length; i++) {
    let matcher = string[i].match(/[\]\}\)]/);
    if (matcher) {
      if (string[i-1].charCodeAt(0) - matcher[0].charCodeAt(0) < 3) {
        string = string.slice(0,i-1) + string.slice(i+1);
        i = i-2;
      } else {
        i = i + string.length;
      }
    }
  }
  if (string == "") {
    return true;
  } else {
    return false;
  }
}

export { bracketPush };
