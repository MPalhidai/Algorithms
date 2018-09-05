const KEY_LENGTH = 100;
const POSSIBLE = "abcdefghijklmnopqrstuvwxyz";

function make_key() {
  let new_key = "";
  for (let i = 0; i < KEY_LENGTH; i++) {
    new_key += POSSIBLE.charAt(Math.floor(Math.random() * POSSIBLE.length));
  };
  return new_key;
};

function shift_chars(key, text, direction) {
  let output_text = "";

  while (key.length < text.length) {
    key += key;
  };

  for (let i = 0; i < text.length; i++) {
    // Refactor using POSSIBLE instead of charCode shift
    let charCode = (text.charCodeAt(i) - 97) + (key.charCodeAt(i) - 97) * direction;

    if (charCode >= 26) {
      charCode -= 26;
    } else if (charCode < 0) {
      charCode += 26;
    }

    output_text += String.fromCharCode(97 + charCode);
  };
  
  return output_text;
};

export default function Cipher(key) {
	if (typeof key === 'undefined') {
		key = make_key();
	} else if (key.length === 0 || key.match(/[^a-z]/,"g")) {
		throw(new Error("Bad key"));
	}

	return {
		key,
		encode: function(plain_text){
			return shift_chars(this.key, plain_text, 1);
		},
		decode: function(encoded_text){
			return shift_chars(this.key, encoded_text, -1);
		}
	};
};
