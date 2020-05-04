var inherit = function(parentClass, childClass) {
  var Surrogate = function(){};
  Surrogate.prototype = parentClass.prototype;
  childClass.prototype = new Surrogate();
  childClass.prototype.constructor = childClass;
}

module.exports = inherit;