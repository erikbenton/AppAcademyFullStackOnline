const Utils = {
  // Inherit the parent class
  inherits(childClass, parentClass) {
    let Surrogate = function(){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },
  // Get a random vector
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Utils.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Utils;