"use strict";

function soundMaker(sound, times) {
  
  // Closure - Using the 'sound' variable from when soundMaker was defined
  function makeSound() {
    console.log(`${sound}`);
  }

  for(let i = 0; i < times; i++) {
    makeSound();
  }
}

function multiplication(arr) {
  let sum = 1;

  // Closure
  function multiplicator() {
    for(let i = 0; i < arr.length; i++) {
      sum *= arr[i]
    }
  }

  multiplicator();

  return sum;
}

let callback = function() {
  console.log("It has been 5 seconds");
};


soundMaker("yee-haw", 5);
console.log(multiplication([1,2,3,4]));

let timeToWait = 5000;
// global.setTimeout(callback, timeToWait);

// Or, more likely to see
// global.setTimeout(function() {
//     console.log("It has been 5 seconds");
// }, timeToWait);
// ^^ this is ES5

// This is ES6 (preferred syntax)
global.setTimeout(() => console.log("It has been 5 seconds!"), timeToWait);