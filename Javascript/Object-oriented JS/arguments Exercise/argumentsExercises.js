const sum = function() {
  let res = 0.0;
  for(let i = 0; i < arguments.length; i++) {
    res += arguments[i];
  }
  return res;
}

const sumRest = function(...theseArgs) {
  return theseArgs.reduce((previous, current) => {
    return current + previous;
  });
}

console.log(sum(4,9,6));
console.log(sumRest(4,9,6));

Function.prototype.myBind = function(context) {
  let fn = this;
  let bindArgs = Array.from(arguments).slice(1);
  return function boundFn() {
    let callArgs = Array.from(arguments);
    return fn.apply(context, bindArgs.concat(callArgs));
  };
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

const curriedSum = function(numArgs) {
  let numbers = [];
  let _curriedSum = function(num) {
    numbers.push(num);
    if(numbers.length == numArgs) {
      let sum = numbers[0];
      for(let i = 1; i < numArgs; i++) {
        sum += numbers[i];
      }
      return sum;
    }
    return _curriedSum;
  };
  return _curriedSum;
}

const sumCurry = curriedSum(4);
console.log(sumCurry(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  let callee = this;
  let allArgs = [];
  let _curry = function() {
    allArgs = allArgs.concat(Array.from(arguments));
    if(allArgs.length >= numArgs) {
      return callee(...allArgs.splice(0, numArgs));
    }
    return _curry;
  }
  return _curry;
};

Function.prototype.curry2 = function(numArgs) {
  let callee = this;
  let allArgs = [];
  let _curry2 = function() {
    allArgs = allArgs.concat(Array.from(arguments));
    if(allArgs.length >= numArgs) {
      return callee.apply(null, allArgs.splice(0, numArgs));
    }
    return _curry2;
  }
  return _curry2;
};

function sum3(x, y, z) {
  return x + y + z;
}

let sumThree = sum3.curry(3);
sumThree = sumThree(1,2);
console.log(sumThree(3,4));

sumThree = sum3.curry2(3);
sumThree = sumThree(5,6);
console.log(sumThree(7,8));