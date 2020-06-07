const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");
const Utils = require("./utils.js");

const DIM_X = 500;
const DIM_Y = 500;
const NUM_ASTEROIDS = 20;

function Game(xDim, yDim) {
  this.xDim = DIM_X;
  this.yDim = DIM_Y;
  this.asteroids = [];
  this.ship = new Ship({pos: Utils.randomPos(this.xDim, this.yDim)}, this);
  this.addAsteroids(NUM_ASTEROIDS);
};

Game.prototype.addAsteroids = function(numAsteroids) {
  for(let i = 0; i < numAsteroids; i++) {
    let newAsteroid = new Asteroid({ pos: Utils.randomPos(this.xDim, this.yDim)}, this);
    this.asteroids.push(newAsteroid);
  }
};

Game.prototype.moveObjects = function(ctx) {
  this.allObjects().forEach(object => {
    object.move();
    object.draw(ctx);
  });
};

Game.prototype.wrap = function(pos) {
  pos[0] %= this.xDim;
  pos[1] %= this.yDim;
  if(pos[0] < 0) {
    pos[0] =  this.xDim - pos[0];
  }
  if(pos[1] < 0) {
    pos[1] =  this.yDim - pos[1];
  }
  return pos;
}

Game.prototype.checkCollisions = function() {
  let objects = this.allObjects();
  let objectsToRemove = [];
  for(let i = 0; i < objects.length; i++) {
    for(let j = i+1; j < objects.length; j++) {
      if(objects[i].isCollidedWith(objects[j])) {
        objectsToRemove.push(objects[i].collideWith(objects[j]));
        // objectsToRemove.push(objects[j].collideWith(objects[i]));
      }
    }
  }
  objectsToRemove.forEach(object => this.remove(object));
};

Game.prototype.step = function(ctx) {
  this.moveObjects(ctx)
  this.checkCollisions();
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.xDim, this.yDim);
  this.step(ctx);
};

Game.prototype.remove = function(asteroid) {
  let index = this.asteroids.indexOf(asteroid);
  if (index > -1) {
    this.asteroids.splice(index, 1);
  }
};

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
}

module.exports = Game;