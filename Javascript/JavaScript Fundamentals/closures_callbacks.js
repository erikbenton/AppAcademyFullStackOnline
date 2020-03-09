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



soundMaker("yee-haw", 5);
console.log(multiplication([1,2,3,4]));