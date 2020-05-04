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
  const expHelper = (base, exp) => {
    if(exp < 1) {
      return 1;
    }
    if(exp == 1) {
      return base;
    }
    if (exp % 2 == 0) {
      return expHelper(base, (exp / 2)) * expHelper(base, (exp / 2));
    } else {
      return base * (expHelper(base, (exp - 1) / 2)) * (expHelper(base, (exp - 1) / 2));
    }

  };
  return expHelper(base, exp);
};

console.log(exponentV2(0,0));
console.log(exponentV2(2,1));
console.log(exponentV2(3,4));
console.log(exponentV2(5,5));

const fibonacci = (n) => {
  let fibbs = [];
  const fibHelp = (n) => {
    if (n == 0) {
      return fibbs;
    }
    if (fibbs.length < 2) {
      fibbs.push(1);
      fibHelp(n - 1);
    } else {
      let last_ind = fibbs.length - 1;
      fibbs.push(fibbs[last_ind] + fibbs[last_ind - 1]);
      fibHelp(n - 1);
    }
  };
  fibHelp(n);
  return fibbs;
};

console.log(fibonacci(5));
console.log(fibonacci(10));

const deepDup = (arr) => {
  let dupped = []
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] instanceof Array) {
      dupped.push(deepDup(arr[i]));
    }
    else {
      dupped.push(arr[i]);
    }
  }
  return dupped;
};

let arr1 = range(0,1);
let arr2 = range(5,6);
let arr3 = range(0,1);
let arr4 = range(20,21);
let twoDArr = [arr1, arr2, arr3, arr4];
let all_arr = [[arr1, arr2, arr3, arr4], [arr1, arr2, arr3, arr4]];
console.log(all_arr);
console.log(deepDup(all_arr));

const bsearch = (arr, target) => {
  
  let end = arr.length;
  let start = 0;

  const binHelp = (arr, target) => {
    let diff = end - start;
    let mid = start + Math.floor(diff / 2);
    
    if (arr[mid] == target) {
      return mid;
    }
    if (diff == 0 || mid >= arr.length || mid < 0) {
      return -1;
    }

    if (target > arr[mid]) {
      start = mid + 1;
      return binHelp(arr, target);
    } else {
      end = mid - 1;
      return binHelp(arr, target);
    }
  };

  return binHelp(arr, target);  
};

let ranges = range(0, 11);
console.log(bsearch(ranges, 3));
console.log(bsearch(ranges, 11));
console.log(bsearch(ranges, 23));
console.log(bsearch(ranges, 9));
console.log(bsearch(ranges, -1));
console.log(bsearch(ranges, 0));

const mergesort = (arr) => {
  
  const mergeHelp = (arr) => {
    
    if (arr.length == 1) {
      return arr;
    } else {
      let mid = Math.floor(arr.length / 2);
      let left = mergeHelp(arr.slice(0, mid));
      let right = mergeHelp(arr.slice(mid));
      return merger(left, right);
    }
  };

  const merger = (left, right) => {
    let l_ind = 0;
    let r_ind = 0;
    let mergedArray = [];
    while (l_ind < left.length && r_ind < right.length) {
      if (left[l_ind] < right[r_ind]) {
        mergedArray.push(left[l_ind])
        l_ind++;
      } else {
        mergedArray.push(right[r_ind]);
        r_ind++;
      }
    }
    if (l_ind < left.length) {
      mergedArray = mergedArray.concat(left.slice(l_ind));
    }
    if (r_ind < right.length) {
      mergedArray = mergedArray.concat(right.slice(r_ind));
    }
    return mergedArray;
  };

  return mergeHelp(arr);
};

console.log(mergesort([3,4,2,5,1,3,7]));

const subsets = (arr) => {

};