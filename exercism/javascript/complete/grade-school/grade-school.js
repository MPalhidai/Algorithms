const School = () => {
  const kids = {};
  const roster = () => kids;
  const grade = year => kids[year] || [];
  const add = (name, year) => {
    kids[year] ? kids[year].push(name) : kids[year] = [name];
    kids[year].sort();
  };
  return { roster, grade, add };
};

export default School;
