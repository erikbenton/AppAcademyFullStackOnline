const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var teaAndBiscuits = function() {
  reader.question("Would you like some tea?\n", function(answer1) {
    reader.question("Would you like some biscuits?\n", function(answer2) {
      console.log(`So you ${answer1} want some tea and you ${answer2} want coffee.`);
    });
  });
};

teaAndBiscuits();