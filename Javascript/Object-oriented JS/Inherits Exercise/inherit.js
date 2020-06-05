Function.prototype.inherits = function(parentClass) {
  var Surrogate = function(){};
  Surrogate.prototype = parentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function(parentClass) {
  var Surrogate = function(){};
  Surrogate.prototype = parentClass.prototype;
  this.prototype = Object.create(Surrogate.prototype);
  this.prototype.constructor = this;
};

function MovingObject () {
}

MovingObject.prototype.speak = function() {
  console.log("Hi");
};

function Ship () {}
Ship.inherits2(MovingObject);

let ship = new Ship();
ship.speak();