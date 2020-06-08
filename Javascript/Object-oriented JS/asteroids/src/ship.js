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
  let bullet = new Bullet({pos: this.pos, vel: Utils.scale(this.pos, 3)}, this.game);
  this.game.bullets.push(bullet);
};

module.exports = Ship;