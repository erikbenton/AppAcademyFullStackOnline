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
      let moves = this.isValidMove(input)
      if(moves) {
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

    let pos1 = parseInt(inputArr[0]) - 1;
    let pos2 = parseInt(inputArr[1]) - 1;
    let val1, val2, i;
    
    if( (pos1 > 2 || pos1 < 0 || isNaN(pos1))
       || (this.towers[pos1][0] == 0)) {
      return false;
    } else {
      i = 2;
      val1 = this.towers[pos1][i];
      while(this.towers[pos1][i] == 0 && i >= 0) {
        val1 = this.towers[pos1][i];
        i--;
      }
    }
    if( pos2 > 2 || pos2 < 0 || isNaN(pos2)) {
      return false;
    } else {
      i = 2;
      val2 = this.towers[pos2][i];
      while(this.towers[pos2][i] == 0 && i >= 0) {
        val2 = this.towers[pos2][i];
        i--;
      }
      if( (val1 > val2) && val2 != 0) {
        return false;
      }
    }

    return [pos1, pos2, val1, val2];
  }

  _isOver() {

  }

}

let game = new Game();

game.printStacks();
game.promptMove(game.move());