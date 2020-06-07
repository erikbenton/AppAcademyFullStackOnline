/**
 * Movign Object class.
 *
 * @constructor
 * @param {Object} optObj - options for moving object.
 */

function MovingObject(optObj, game) {
  this.pos = optObj["pos"];
  this.vel = optObj["vel"];
  this.radius = optObj["radius"];
  this.color = optObj["color"];
  this.game = game;
}

MovingObject.prototype.speak = function() {
  console.log("Moving Object can speak");
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.pos = this.game.wrap(this.pos);
}

module.exports = MovingObject;