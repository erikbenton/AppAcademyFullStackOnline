var Animal = require("./animal.js");
var inherit = require("./inherit.js");

function Cat(name) {
  Animal.call(this, name);
}

inherit(Animal, Cat);

Cat.prototype.meow = function() {
  console.log("Meow, I am " + this.name);
}

module.exports = Cat;