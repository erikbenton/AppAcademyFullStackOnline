const Asteroid = require("./asteroid.js");
const Utils = require("./utils.js");

const DIM_X = 500;
const DIM_Y = 500;
const NUM_ASTEROIDS = 20;

function Game(xDim, yDim) {
  this.xDim = xDim;
  this.yDim = yDim;
  this.asteroids = [];
  this.addAsteroids(NUM_ASTEROIDS);
};

Game.prototype.addAsteroids = function(numAsteroids) {
  for(let i = 0; i < numAsteroids; i++) {
    let newAsteroid = new Asteroid({ pos: Utils.randomPos(this.xDim, this.yDim)})
    this.asteroids.push(newAsteroid);
  }
};

Game.prototype.moveObjects = function(ctx) {
  this.asteroids.forEach(asteroid => {
    asteroid.draw(ctx);
  });
}

Game.prototype.start = function(ctx) {
  
  this.moveObjects(ctx);

  //this function will update the position of all the moving objects,
  //clear the canvas, and redraw them
  var animateCallback = function(){
    this.next(ctx);
    requestAnimationFrame(animateCallback);

    //if we didn't know about requestAnimationFrame, we could use setTimeout
    //setTimeout(animateCallback, 1000/60);
  }.bind(this);

  //this will cause the first render and start the endless triggering of
  //the function using requestAnimationFrame
  animateCallback();

}

Game.prototype.next = function(ctx) {
  ctx.clearRect(0, 0, this.xDim, this.yDim);
  this.asteroids.forEach(asteroid => {
    asteroid.move();
    asteroid.draw(ctx);
  });
}

module.exports = Game;