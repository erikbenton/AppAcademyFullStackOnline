function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function() {
  console.log("Mmmm, food...");
}

module.exports = Animal;