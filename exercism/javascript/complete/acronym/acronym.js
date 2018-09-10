const Acronyms = () => {
  const parse = (text) => {
    let stop = text.indexOf(':');
    let spaced = text.split(/[- ]/);

    if (stop > -1) text = text.slice(0, stop);

    if (spaced.every((word) => /[A-Z]/.test(word[0]))) {
      return text.match(/[A-Z]/g).join("");
    } else {
      return spaced.map((word) => word[0].toUpperCase()).join("");
    }

  }

  return { parse }
}

export default Acronyms;
