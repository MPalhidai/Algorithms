const RotationalCipher = () => {
  const rotate = (text, ammount) => {
    let arr = text.split("");
    for ( let i = 0; i < text.length; i++ ) {
      let code = arr[i].charCodeAt(0);
      if (arr[i].match(/[a-z]/i)) {
        if (arr[i].match(/[a-z]/) && code - 97 + ammount >= 26 || arr[i].match(/[A-Z]/) && code - 65 + ammount >= 26) {
          code = code + ammount - 26;
        } else {
          code = code + ammount;
        }
        arr[i] = String.fromCharCode(code);
      }

    }
    return arr.join("");
  }

  return { rotate };
}

export default RotationalCipher;
