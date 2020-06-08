const MovingObject = require("./moving_object.js");
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
  this.isWrappable = false;
}

Utils.inherits(Bullet, MovingObject);

module.exports = Bullet;