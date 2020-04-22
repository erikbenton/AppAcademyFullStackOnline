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

  prompMove() {

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
  
  move(from, to) {

  }

  _isValidMove(from, to) {

  }

  _isOver() {

  }

}

let game = new Game();

game.printStacks();