const DiffieHellman = (prime1, prime2) => {

  const isNotPrime = (key) => {
    let output = false;
    if (key <= 1) {
      output = true;
    } else {
      for (let i = 2; i < key/2; i++) {
        if (key % i == 0) {
          output = true;
          i = key;
        }
      }
    }
    return output;
  }

  const getPublicKeyFromPrivateKey = (numb) => {
    if (numb >= prime1 || numb <= 1) throw(new Error("Invalid private key"));
    return prime2 ** numb % prime1;
  }

  const getSharedSecret = (key1, key2) => {
    return key2 ** key1 % prime1;
  }

  if (isNotPrime(prime1) || isNotPrime(prime1)) {
    throw(new Error("Not prime"));
  }

  return { getPublicKeyFromPrivateKey, getSharedSecret }
}

export default DiffieHellman;
