const madlib = function(verb, adjective, noun) {
  verb = verb.toUpperCase();
  adjective = adjective.toUpperCase();
  noun = noun.toUpperCase();
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
  return;
};

madlib('make', 'best', 'guac');

const isSubstring = function(searchString, subString) {
  let words = searchString.split(" ");
  return words.some(word => word === subString);
};

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

const fizzBuzz = function(arr) {
  let res = arr.filter(number => {
    return (((number % 3 == 0) || (number % 5 ==0)) && !((number % 3 == 0) && (number % 5 == 0)));
  })
  return res;
};

console.log(fizzBuzz([1,3,5,10,15,21,30,42]));

const isPrime = (number) => {
  let i = 2;
  while (i < number) {
    if (number % i == 0) {
      return false;
    }
    i++;
  }
  return true;
};

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

const sumOfNPrimes = (n) => {
  let currentNumber = 2;
  let sum = 0;
  let count = 0;
  while (count < n) {
    if (isPrime(currentNumber)) {
      sum += currentNumber;
      count++;
    }
    currentNumber++;
  }
  return sum;
};

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
