const MovingObject = require("./moving_object.js");
const Utils = require("./utils.js");
window.MovingObject = MovingObject;

/**
 * Asteroid class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */

const COLOR = "#111111";
const RADIUS = 20;

function Asteroid(optObj) {
  optObj["vel"] = Utils.randomVec(1);
  optObj["radius"] = RADIUS;
  optObj["color"] = COLOR;
  MovingObject.call(this, optObj);
}

Utils.inherits(Asteroid, MovingObject);

module.exports = Asteroid;