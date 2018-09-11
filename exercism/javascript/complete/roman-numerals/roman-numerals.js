const toRoman = (number) => {
  let romans = {"M":1000,"CM":900,"D":500,"CD":400,"C":100,"XC":90,"L":50,"XL":40,"X":10,"IX":9,"V":5,"IV":4,"I":1};
  let numerals = "";
  for (let key in romans) {
    let temp = Math.floor(number / romans[key]);
    if (temp > 0) {
      numerals += key.repeat(temp);
      number -= romans[key]*temp;
    }
  }
  return numerals;
}

export default toRoman;
