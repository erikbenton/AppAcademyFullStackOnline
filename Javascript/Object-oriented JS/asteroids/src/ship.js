const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

const COLOR = "#0088FF";
const RADIUS = 5;

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
  this.vel[0] += impulse;
  this.vel[1] += impulse;
}

module.exports = Ship;