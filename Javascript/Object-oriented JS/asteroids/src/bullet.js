const MovingObject = require("./moving_object.js");
const Ship = require("./ship.js");
const Asteroid = require("./asteroid.js");
const Utils = require("./utils.js");

const COLOR = "#FF0000";
const RADIUS = 5;

/**
 * Bullet class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */
function Bullet(optObj, game) {
  optObj["radius"] = RADIUS;
  optObj["color"] = COLOR;
  MovingObject.call(this, optObj, game);
}

Utils.inherits(Bullet, MovingObject);

Bullet.prototype.collideWith = function(otherObject) {
  // if(otherObject instanceof Ship) {
  //   otherObject.relocate();
  // } else if(otherObject instanceof Asteroid) {
  //   return otherObject;
  // }
  return [];
};

module.exports = Bullet;