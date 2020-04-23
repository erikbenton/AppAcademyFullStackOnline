const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  
  constructor() {
    this.towers = [[3,2,1],[0,0,0],[0,0,0]];
  }

  run() {
    // While the game isn't over
      // Ask the user for a "From and To tower"
      // Check if valid, report if not
      // Move the discs
  }

  promptMove(callback) {
    reader.question("What are your 'From' and 'To' towers? [eg 1 3]\n", function(answer) {
      callback(answer);
    })
  }

  printStacks() {
    let colInd = 0;
    let rowInd = 2;
    while(rowInd > -1) {
      let line = " ";
      while(colInd < 3) {
        if(this.towers[colInd][rowInd] == 0) {
          line += "| ";
        } else {
          line += `${this.towers[colInd][rowInd]} `;
        }
        colInd++;
      }
      console.log(line);
      colInd = 0;
      rowInd--;
    }
  }
  
  move() {
    return (input) => {
      if(this.isValidMove(input)) {
        let moves = input.split(" ");
        console.log("yay");
      } else {
        console.log("Not a valid move");
      }
      this.promptMove(this.move());
    }
  }

  isValidMove(input) {
    if( !(typeof input === 'string' || input instanceof String) ) {
      return false;
    }
    let inputArr = input.split(" ");

    if(inputArr.length != 2) {
      return false;
    }

    for(let i = 0; i < inputArr.length; i++) {
      let pos = parseInt(inputArr[i]);
      if( pos > 2 || pos < 0 || isNaN(pos)) {
        return false;
      }
    }

    return true;
  }

  _isValidMove(from, to) {

  }

  _isOver() {

  }

}

let game = new Game();

game.printStacks();
game.promptMove(game.move());