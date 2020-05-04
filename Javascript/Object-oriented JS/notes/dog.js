var Animal = require("./animal.js");
var inherit = require("./inherit.js");

function Dog(name) {
  Animal.call(this, name);
}

inherit(Animal, Dog);

Dog.prototype.woof = function() {
  console.log("Woof, I am " + this.name);
}

module.exports = Dog;