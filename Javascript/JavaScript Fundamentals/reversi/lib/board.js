let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8)
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
class Board {
  constructor() {
    this.grid = _makeGrid();
  }
  /**
   * Returns the piece at a given [x, y] position,
   * throwing an Error if the position is invalid.
   */
  getPiece(pos) {
    let x = pos[0];
    let y = pos[1];
    return this.grid[x][y];
  }
  /**
   * Checks if there are any valid moves for the given color.
   */
  hasMove(color) {
    let moves = this.validMoves(color);
    return moves.length > 0;
  }
  /**
   * Checks if the piece at a given position
   * matches a given color.
   */
  isMine(pos, color) {
    let spot = this.getPiece(pos);
    if (spot) {
      return spot.color === color;
    }
    return false;
  }
  /**
   * Checks if a given position has a piece on it.
   */
  isOccupied(pos) {
    let spot = this.getPiece(pos);
    return spot instanceof Piece;
  }
  /**
   * Checks if both the white player and
   * the black player are out of moves.
   */
  isOver() {
    return !( this.hasMove('white') || this.hasMove('black') );
  }
  /**
   * Checks if a given position is on the Board.
   */
  isValidPos(pos) {
    try {
      let x = pos[0];
      let y = pos[1];
      return ( (x > -1 && x < 8) && (y > -1 && y < 8) );
    } catch (error) {
      
    }
  }
  /**
   * Adds a new piece of the given color to the given position, flipping the
   * color of any pieces that are eligible for flipping.
   *
   * Throws an error if the position represents an invalid move.
   */
  placePiece(pos, color) {
  }
  /**
   * Prints a string representation of the Board to the console.
   */
  print() {
  }
  /**
   * Checks that a position is not already occupied and that the color
   * taking the position will result in some pieces of the opposite
   * color being flipped.
   */
  validMove(pos, color) {
    let moves = this.validMoves(color);
    let res = false;

    moves.forEach(function(move, index) {
      if ( (move[0] == pos[0]) && (move[1] == pos[1]) ) {
        res = true;
      }
    })
    return res;
  }
  /**
   * Produces an array of all valid positions on
   * the Board for a given color.
   */
  validMoves(color) {
    let moves = [];
    for(let row = 0; row < this.grid.length; row++) {
      for(let col = 0; col < this.grid[row].length; col++) {
        let pos = [row, col];
        if ( this.isMine(pos, color) ) {
          let spot = this.getPiece(pos);
          Board.DIRS.forEach(move => {
            let new_pos = [row + move[0], col + move[1]];
            try {
              if (this.isValidPos(new_pos)) {
                if ( !this.isMine(new_pos, color) && (this.getPiece(new_pos) instanceof Piece)) {
                  // Now we have finally found a piece on the board of 'color'
                  // with an adjacent piece of the opposite color
                  try {
                    let opp_pos = new_pos;
                    while (this.isValidPos(opp_pos) && !this.isMine(opp_pos, color)) {
                      opp_pos[0] = opp_pos[0] + move[0];
                      opp_pos[1] = opp_pos[1] + move[1];
                      let opp_piece = this.getPiece(opp_pos);
                      if (!(opp_piece instanceof Piece)) {
                        moves.push(opp_pos);
                        opp_pos = [-1, -1];
                      }
                      if (this.isMine(opp_pos, color)){
                        opp_pos = [-1, -1];
                      }
                    }
                  } catch (error) {

                  }
                }
              }
            } catch (error) {
              
            }
          });
        }
      }
    }
    return moves;
  }
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];







/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
}





module.exports = Board;

// let test_board = new Board();
// let the_moves = test_board.validMoves("black");
// // console.log(the_moves[3] == [2,3]);
// // console.log(the_moves.includes([2,3]));



// the_moves.forEach(function(move, index) {
//   let validPositions = [
//     [5, 4],
//     [3, 2],
//     [4, 5],
//     [2, 3]
//   ];
//   let validPosition = validPositions[index];
//   console.log(`Actual: ${move}`);
//   console.log(` Valid: ${validPosition}`);
//   console.log(`${move[0] == validPosition[0]} and ${move[1] == validPosition[1]}`);
//   // assert.equal(actualPosition[0], validPosition[0]);
//   // assert.equal(actualPosition[1], validPosition[1]);
// });
