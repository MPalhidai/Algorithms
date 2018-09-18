const Triangle = (level) => {
  let rows = [[1]]

  for (let i = 1; i < level; i++) {
    let array = []
    for (let x = 0; x <= rows[i-1].length; x++) {
      if (x == 0 || x == rows[i-1].length) {
        array.push(1)
      } else {
        array.push(rows[i-1][x-1] + rows[i-1][x])
      }
    }
    rows.push(array)
  }
  const lastRow = rows[rows.length-1]
  return { rows, lastRow }
}

export default Triangle
