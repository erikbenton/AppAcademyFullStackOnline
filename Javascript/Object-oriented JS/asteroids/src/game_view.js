const Game = require("./game.js");
const Utils = require("./utils.js");

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game();
};

GameView.prototype.start = function() {
  
  this.game.moveObjects(this.ctx);

  //this function will update the position of all the moving objects,
  //clear the canvas, and redraw them
  var animateCallback = function(){
    this.draw(this.ctx);
    requestAnimationFrame(animateCallback);

    //if we didn't know about requestAnimationFrame, we could use setTimeout
    //setTimeout(animateCallback, 1000/60);
  }.bind(this);

  //this will cause the first render and start the endless triggering of
  //the function using requestAnimationFrame
  animateCallback();
};

GameView.prototype.draw = function() {
  this.ctx.clearRect(0, 0, this.game.xDim, this.game.yDim);
  this.game.asteroids.forEach(asteroid => {
    asteroid.move();
    asteroid.draw(this.ctx);
  });
};

module.exports = GameView;