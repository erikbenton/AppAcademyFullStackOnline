const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Bullet = require("./bullet.js");
const Utils = require("./utils.js");

const COLOR = "#555555";
const RADIUS = 20;

/**
 * Asteroid class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */
function Asteroid(optObj, game) {
  optObj["vel"] = Utils.randomVec(1);
  optObj["radius"] = RADIUS;
  optObj["color"] = COLOR;
  MovingObject.call(this, optObj, game);
}

Utils.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if(otherObject instanceof Ship) {
    otherObject.relocate();
  } else if(otherObject instanceof Bullet) {
    return [this, otherObject];
  }
  return [];
};

module.exports = Asteroid;