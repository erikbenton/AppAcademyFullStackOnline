Array.prototype.myEach = function(func) {
  return this.map(val => func(val));
};

let arr = [1,2,3,4];
arr.myEach(console.log);

Array.prototype.myMap = function(func) {

};