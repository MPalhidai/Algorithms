const Raindrops = () => {
  const sounds = { 3:"Pling", 5:"Plang", 7:"Plong" }
  const convert = (number) => {
    let noise = "";
    for (let key in sounds) {
      if (number % key == 0) {
        noise += sounds[key];
      }
    }

    if (noise == "") {
      return number.toString();
    } else {
      return noise;
    }
  }

  return { convert };
}

export default Raindrops;
