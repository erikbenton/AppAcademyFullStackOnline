const range = (start, end) => {
  let rangeArray = [];
  const rangeHelper = (start, end) => {
    rangeArray.push(start);
    if (start == end) {
      return;
    }
    rangeHelper(start + 1, end);
  }
  rangeHelper(start, end);
  return rangeArray;
};
let arr = range(0, 5);
console.log(arr);

const sumRec = (arr) => {
  let sum = 0;
  const sumHelp = (arr) => {
    sum += arr[0];
    if (arr.length < 2) {
      return;
    } else {
      sumHelp(arr.slice(1));
    }
  };
  sumHelp(arr);
  return sum;
};

console.log(sumRec(arr));

const exponentV1 = (base, exp) => {
  let res = 1;
  const expHelper = (base, exp) => {
    if (exp < 1) {
      return;
    }
    res *= base;
    expHelper(base, (exp - 1));
  };
  expHelper(base, exp);
  return res;
};

console.log(exponentV1(0,0));
console.log(exponentV1(2,1));
console.log(exponentV1(3,2));
console.log(exponentV1(5,5));

const exponentV2 = (base, exp) => {
  let res = 1;
  const expHelper = (base, exp) => {
    if(exp < 1) {
      return 1;
    }
    if(exp == 1) {
      return base;
    }
    if (exp % 2 == 0) {
      let res1 = expHelper(base, (exp / 2));
      let res2 = expHelper(base, (exp / 2));
      res = res1 * res2;
    } else {
      res = base * (expHelper(base, (exp - 1) / 2)) * (expHelper(base, (exp - 1) / 2));
    }

  };
  expHelper(base, exp);
  return res;
};

console.log(exponentV2(0,0));
console.log(exponentV2(2,1));
console.log(exponentV2(3,4));
console.log(exponentV2(5,5));