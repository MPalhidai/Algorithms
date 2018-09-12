const Squares = (num) => {

  const range = () => { return [...Array(num+1).keys()]; }
  const squareOfSum = (range().reduce((acc, x) => acc += x))**2;
  const sumOfSquares = range().reduce((acc, x) => acc += x**2);
  const difference = squareOfSum - sumOfSquares;

  return { squareOfSum, sumOfSquares, difference }
}

export default Squares;
