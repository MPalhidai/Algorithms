const secretHandshake = (hex) => {
  const regex = /^[0-9]*$/g
  if (!regex.test(hex)) throw(new Error('Handshake must be a number'));
  let output = []
  const hash = { 1:"wink", 2:"double blink", 4:"close your eyes", 8:"jump", 16:"reverse" }

  for (let key in hash) {
    if (hex == 0) break
    if ((hex & key) == key) {
      key == 16 ? output.reverse() : output.push(hash[key])
      hex -= key
    }
  }

  return output
}

export { secretHandshake }
