Array.prototype.uniq = function() {
  let res = [];
  this.forEach(el => {
    if (!res.includes(el)) {
      res.push(el);
    }
  });
  return res;
};

console.log(([1,2,2,3,3,3]).uniq());

Array.prototype.twoSum = function() {
  let res = [];
  for (let i = 0; i < this.length; i++) {
    let num_1 = this[i];
    for (let j = i; j < this.length; j++) {
      let num_2 = this[j];
      if (num_1 + num_2 == 0) {
        res.push([i, j]);
      }
    }
  }
  return res;
};

console.log(([1,-1,2,3,5,-5]).twoSum());

Array.prototype.transpose = function() {
  let res = [];
  this[0].forEach(col => res.push([]));
  for (let i = 0; i < this.length; i++) {
    let row = this[i];
    for (let j = 0; j < row.length; j++) {
      let val = row[j];
      res[j].push(val);
    }
  }
  return res;
};

let items = [
  [1, 2],
  [3, 4],
  [5, 6]
];

console.log(items.transpose());