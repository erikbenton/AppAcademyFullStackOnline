Array.prototype.myEach = function(func) {
  return this.forEach(val => func(val));
};

let arr = [1,2,3,4];
arr.myEach(console.log);

Array.prototype.myMap = function(func) {
  let mappedArray = [];
  this.myEach(el => mappedArray.push(func(el)) );
  return mappedArray;
};

const timesTwo = function(val) {
  return val * 2;
};

let anotherArr = arr.myMap(timesTwo);
console.log(anotherArr);
console.log(arr);


Array.prototype.myReduce = function(func, initVal) {
  let arr = this;
  if (initVal === undefined) {
    initVal = arr[0];
    arr = arr.slice(1);
  }
  let sum = initVal;
  arr.myEach(el => sum = func(sum, el));
  
  return sum;
};

console.log(arr.myReduce( (total, item) => total + item ));