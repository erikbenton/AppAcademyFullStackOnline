const Utils = {
  /**
   * Sets up the inheritance prototype chain.
   * @param {Object} childClass - Child class that inherits from parentClass.
   * @param {Object} parentClass - Parent class that childClass inherits from.
   */
  inherits(childClass, parentClass) {
    let Surrogate = function(){};
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },
  /**
   * Gets a random 2d vector
   * @param {Number} length - length/norm of the vector.
   */
  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Utils.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  /**
   * Scales a 2d vector
   * @param {Array} vec - 2D vector to be scaled.
   * @param {Number} m - length to scale the 2d vector by.
   */
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Utils;