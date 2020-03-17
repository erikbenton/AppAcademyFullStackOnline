Array.prototype.bubbleSort = function() {
  let madeSwap = true;
  let sorted = this;
  while (madeSwap) {
    madeSwap = false;
    for (let i = 0; i < sorted.length - 1; i++) {
      if (sorted[i] > sorted[i+1]) {
        let temp = sorted[i];
        sorted[i] = sorted[i+1];
        sorted[i+1] = temp;
        madeSwap = true;
      }
    }
  }
  return sorted;
};

arr = [3, 5, 1, 7, 0];

console.log(arr.bubbleSort());

String.prototype.substrings = function() {
  let substringArr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = (i + 1); j < this.length; j++) {
      let sub = this.slice(i, j);
      if (!substringArr.includes(sub)) {
        substringArr.push(this.slice(i, j));
      }
    }
  }
  return substringArr;
};

console.log("bananas".substrings());