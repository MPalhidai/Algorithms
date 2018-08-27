var KEY_LENGTH = 100;
var POSSIBLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

function make_key() {
  var text = "";
  for (var i = 0; i < KEY_LENGTH; i++) {
    text += POSSIBLE.charAt(Math.floor(Math.random() * POSSIBLE.length));
  };
  return text;
};

function xCode(key, inText, sign) {
	console.log(key);
	return inText.split('').reduce(function(outText, letter, ii){
		var offset = sign * POSSIBLE.indexOf(key.charAt(mod(ii, key.length)));
		outText += POSSIBLE.charAt(mod(POSSIBLE.indexOf(letter)+offset ,POSSIBLE.length));
		return outText;
	}, "");
}

function mod(n, m) {
	return ((n % m) + m) % m;
}

module.exports = function(key){
	if (typeof key === 'undefined'){
		key = make_key();
	} else if (key.length === 0 || key.match(/[^a-z]/,"g")){
		throw(new Error("Bad key"));
	}

	return {
		key: key,
		encode: function(plainText){
			return xCode(this.key, plainText, 1);
		},
		decode: function(encodedText){
			return xCode(this.key, encodedText, -1);
		}
	};
};
