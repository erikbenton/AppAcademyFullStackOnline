const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");

const COLOR = "#555555";
const RADIUS = 20;

/**
 * Asteroid class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */
function Asteroid(optObj) {
  optObj["vel"] = Utils.randomVec(1);
  optObj["radius"] = RADIUS;
  optObj["color"] = COLOR;
  MovingObject.call(this, optObj);
}

Utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;