const Triangle = (a,b,c) => {
  const kind = () => {
    if (a <= 0 || b <= 0 || c <= 0) {
      throw(new Error("This is not a triangle"));
    } else if ( a + b < c || a + c < b || b + c < a) {
      throw(new Error("This is not a triangle"));
    } else if (a == b && b == c) {
      return 'equilateral';
    } else if (a == b || b == c || a == c) {
      return 'isosceles';
    } else if (a != b && b != c) {
      return 'scalene';
    }
  }
  return { kind };
}

export default Triangle;
