const Game = require("./game.js");
const Utils = require("./utils.js");

const MOVES = {
  "w": [ 0, -1],
  "a": [-1,  0],
  "s": [ 0,  1],
  "d": [ 1,  0]
}

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
};

GameView.prototype.start = function() {

  this.bindKeyHandlers();

  //this function will update the position of all the moving objects,
  //clear the canvas, and redraw them
  var animateCallback = function(){
    this.game.draw(this.ctx);
    requestAnimationFrame(animateCallback);

    //if we didn't know about requestAnimationFrame, we could use setTimeout
    //setTimeout(animateCallback, 1000/60);
  }.bind(this);

  //this will cause the first render and start the endless triggering of
  //the function using requestAnimationFrame
  animateCallback();
};

GameView.prototype.bindKeyHandlers = function() {
  let ship = this.game.ship;
  Object.keys(MOVES).forEach((k) => {
    key(k, () => ship.power(MOVES[k]));
  });
};

module.exports = GameView;