const Matrix = (string) => {
  let rows = []
  let columns = []

  let array = string.split('\n');
  array.forEach((str) => {
    let newRow = []
    str.split(' ').forEach((numb) => newRow.push(Number(numb)));
    rows.push(newRow)
  });

  for (let row = 0; row < rows.length; row++) {
    let newColumn = []
    for (let column = 0; column < rows.length; column++) {
      newColumn.push(rows[column][row])
    }
    columns.push(newColumn)
  }

  return { rows, columns }
}

export default Matrix
