/**
 * Movign Object class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */

function MovingObject(optObj) {
  this.pos = optObj["pos"];
  this.vel = optObj["vel"];
  this.radius = optObj["radius"];
  this.color = optObj["color"];
}

MovingObject.prototype.speak = function() {
  console.log("Moving Object can speak");
}

module.exports = MovingObject;