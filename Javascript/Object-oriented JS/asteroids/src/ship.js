const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");
const Utils = require("./utils.js");

const COLOR = "#0088FF";
const RADIUS = 10;

function Ship(optObj, game) {
  optObj["vel"] = [0, 0];
  optObj["radius"] = RADIUS;
  optObj["color"] = COLOR;
  MovingObject.call(this, optObj, game);
}

Utils.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = Utils.randomPos(this.game.xDim, this.game.yDim);
}

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function() {
  const norm = Utils.norm(this.vel);
	
  if (norm == 0) {
    // Can't fire unless moving.
    return;
  }

  const relVel = Utils.scale(
    Utils.dir(this.vel),
    1.1
  );

  const bulletVel = [
    relVel[0] + this.vel[0], relVel[1] + this.vel[1]
  ];
  const bullet = new Bullet({pos: this.pos.slice(0), vel: bulletVel}, this.game);
  this.game.addBullet(bullet);
};

module.exports = Ship;