const Game = require("./game.js");
const Utils = require("./utils.js");

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
};

GameView.prototype.start = function() {

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

module.exports = GameView;