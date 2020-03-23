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
  }
  /**
   * Checks if there are any valid moves for the given color.
   */
  hasMove(color) {
  }
  /**
   * Checks if the piece at a given position
   * matches a given color.
   */
  isMine(pos, color) {
  }
  /**
   * Checks if a given position has a piece on it.
   */
  isOccupied(pos) {
  }
  /**
   * Checks if both the white player and
   * the black player are out of moves.
   */
  isOver() {
  }
  /**
   * Checks if a given position is on the Board.
   */
  isValidPos(pos) {
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
  }
  /**
   * Produces an array of all valid positions on
   * the Board for a given color.
   */
  validMoves(color) {
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
