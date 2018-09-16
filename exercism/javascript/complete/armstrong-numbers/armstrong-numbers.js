const validate = (input) => {
  return input.toString().split("").map((x) => Number(x) ** input.toString().length).reduce((sum, x) => sum += x) == input ? true : false;
}

export { validate };
