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
    this.printStacks();
    this.promptMove(game.move());
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
        this.towers[moves[0]][moves[3]] = 0;
        this.towers[moves[1]][moves[4]] = moves[2];
        this.printStacks();
      } else {
        console.log("Not a valid move");
      }
      if( this._isOver() ) {
        console.log("Yay, you won!");
        reader.close();
      } else {
        this.promptMove(this.move());
      }
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
    let val1, val2, ind1, ind2;
    
    if( (pos1 > 2 || pos1 < 0 || isNaN(pos1))
       || (this.towers[pos1][0] == 0)) {
      return false;
    } else {
      ind1 = 2;
      val1 = this.towers[pos1][ind1];
      while(this.towers[pos1][ind1] == 0 && ind1 >= 0) {
        ind1--;
        val1 = this.towers[pos1][ind1];
      }
    }
    if( pos2 > 2 || pos2 < 0 || isNaN(pos2)
        || (this.towers[pos2][2] != 0) ) {
      return false;
    } else {
      ind2 = 2;
      val2 = this.towers[pos2][ind2];
      while(this.towers[pos2][ind2] == 0 && ind2 >= 0) {
        ind2--;
        val2 = this.towers[pos2][ind2];
      }
      if( (val1 > val2) && val2 != 0) {
        return false;
      }
    }

    return [pos1, pos2, val1, ind1, ind2 + 1];
  }

  _isOver() {
    if(this.towers[2][2] == 1
    && this.towers[2][1] == 2
    && this.towers[2][0] == 3 ) {
      return true;
    }
    
    return false
  }

}

let game = new Game();

game.run();