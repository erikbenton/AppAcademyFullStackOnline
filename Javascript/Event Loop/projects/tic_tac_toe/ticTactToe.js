const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.board = new Board();
  }
}

class Board {
  constructor() {
    this.grid = [["","",""],["","",""],["","",""]];
  }

  won() {

  }

  winner() {

  }

  empty(pos) {
    return this.grid[pos[0]][pos[1]] === "";
  }

  placeMark(pos, mark) {
    if(this.empty(pos)) {
      this.grid[pos[0]][pos[1]] = mark;
    }
  }
}