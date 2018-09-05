var TwoFer = function () {};

TwoFer.prototype.twoFer = function (who) {
  let str = "";
  if(typeof who === 'undefined'){
    //exists
    str = "One for you, one for me.";
  }
  else{
    //doesn't exist
    str = `One for ${who}, one for me.`;
  }

  return str;
};

module.exports = TwoFer;
