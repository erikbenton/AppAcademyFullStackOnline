const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const addNumbers = function(sum, numsLeft, completionCallback) {
  if(numsLeft > 0) {
    // Prompt User for another number
    reader.question("A number, please: ", function(input) {
      // Pass in callback
      let num = parseInt(input);
      sum += num;
      console.log(sum);
      numsLeft -= 1;
      addNumbers(sum, numsLeft, completionCallback);
    })
  }
  else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));