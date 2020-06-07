const Asteroid = require("./asteroid.js");
const Utils = require("./utils.js");

const DIM_X = 500;
const DIM_Y = 500;
const NUM_ASTEROIDS = 20;

function Game(xDim, yDim) {
  this.xDim = DIM_X;
  this.yDim = DIM_Y;
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

module.exports = Game;