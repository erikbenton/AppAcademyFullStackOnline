/**
 * Initializes the Piece with its color.
 */
class Piece {
  constructor(color) {
    this.color = color;
  }
  /**
   * Returns the color opposite the current piece.
   */
  oppColor() {
    return (this.color == "black" ? "white" : "black");
  }
  /**
   * Changes the piece's color to the opposite color.
   */
  flip() {
    this.color = this.color === "black" ? "white" : "black";
  }
  /**
   * Returns a string representation of the string
   * based on its color.
   */
  toString() {
    return  (this.color === "black" ? "B" : "W");
  }
}




module.exports = Piece;
