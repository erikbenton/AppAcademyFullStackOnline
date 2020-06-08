const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");
const Utils = require("./utils.js");

const DIM_X = 800;
const DIM_Y = 500;
const NUM_ASTEROIDS = 10;

function Game(xDim, yDim) {
  this.xDim = DIM_X;
  this.yDim = DIM_Y;
  this.asteroids = [];
  this.ship = new Ship({pos: Utils.randomPos(this.xDim, this.yDim)}, this);
  this.bullets = [];
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

Game.prototype.isOutOfBounds = function(pos) {
  if(pos[0] < 0 || pos[0] > this.xDim) {
    return true;
  }
  if(pos[1] < 0 || pos[1] > this.yDim) {
    return true;
  }
  return false;
};

Game.prototype.checkCollisions = function() {
  const allObjects = this.allObjects();
  for (let i = 0; i < allObjects.length; i++) {
    for (let j = 0; j < allObjects.length; j++) {
      const obj1 = allObjects[i];
      const obj2 = allObjects[j];

      if (obj1.isCollidedWith(obj2)) {
        const collision = obj1.collideWith(obj2);
        if (collision) return;
      }
    }
  }
}

Game.prototype.addBullet = function(bullet) {
  this.bullets.push(bullet);
}

Game.prototype.step = function(ctx) {
  this.moveObjects(ctx)
  this.checkCollisions();
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.xDim, this.yDim);
  this.step(ctx);
};

Game.prototype.remove = function(object) {
  let index = -1;
  if(object instanceof Asteroid) {
    index = this.asteroids.indexOf(object);
    if (index > -1) {
      this.asteroids.splice(index, 1);
    }
  } else if(object instanceof Bullet) {
    index = this.bullets.indexOf(object);
    if (index > -1) {
      this.bullets.splice(index, 1);
    }
  }
};

Game.prototype.allObjects = function() {
  return [].concat(this.asteroids, this.ship, this.bullets);
}

module.exports = Game;