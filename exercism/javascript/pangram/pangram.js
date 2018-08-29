export default function Pangram(text) {
  return {
    isPangram: function() {
      return isPangram(text);
    }
  };
};

function isPangram(text) {

  if (typeof text === 'undefined' || text.length < 26) {
    return false;
  };
  
  let hash = {};
  let regSelect = text.toLowerCase().match(/[a-z]/gi);

  for (let i = 0; i < regSelect.length; i++) {
    hash[regSelect[i]] = true;
  }

  return Object.keys(hash).length == 26;
};
