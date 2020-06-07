/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\r\n\r\nconst COLOR = \"#555555\";\r\nconst RADIUS = 20;\r\n\r\n/**\r\n * Asteroid class.\r\n *\r\n * @constructor\r\n * @param {Object} optObj - options for moving object.\r\n */\r\nfunction Asteroid(optObj, game) {\r\n  optObj[\"vel\"] = Utils.randomVec(1);\r\n  optObj[\"radius\"] = RADIUS;\r\n  optObj[\"color\"] = COLOR;\r\n  MovingObject.call(this, optObj, game);\r\n}\r\n\r\nUtils.inherits(Asteroid, MovingObject);\r\n\r\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\r\n\r\nconst DIM_X = 500;\r\nconst DIM_Y = 500;\r\nconst NUM_ASTEROIDS = 20;\r\n\r\nfunction Game(xDim, yDim) {\r\n  this.xDim = DIM_X;\r\n  this.yDim = DIM_Y;\r\n  this.asteroids = [];\r\n  this.addAsteroids(NUM_ASTEROIDS);\r\n};\r\n\r\nGame.prototype.addAsteroids = function(numAsteroids) {\r\n  for(let i = 0; i < numAsteroids; i++) {\r\n    let newAsteroid = new Asteroid({ pos: Utils.randomPos(this.xDim, this.yDim)}, this);\r\n    this.asteroids.push(newAsteroid);\r\n  }\r\n};\r\n\r\nGame.prototype.moveObjects = function(ctx) {\r\n  this.asteroids.forEach(asteroid => {\r\n    asteroid.move();\r\n    asteroid.draw(ctx);\r\n  });\r\n};\r\n\r\nGame.prototype.wrap = function(pos) {\r\n  pos[0] %= this.xDim;\r\n  pos[1] %= this.yDim;\r\n  if(pos[0] < 0) {\r\n    pos[0] =  this.xDim - pos[0];\r\n  }\r\n  if(pos[1] < 0) {\r\n    pos[1] =  this.yDim - pos[1];\r\n  }\r\n  return pos;\r\n}\r\n\r\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\r\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\r\n\r\nfunction GameView(ctx) {\r\n  this.ctx = ctx;\r\n  this.game = new Game();\r\n};\r\n\r\nGameView.prototype.start = function() {\r\n  \r\n  this.game.moveObjects(this.ctx);\r\n\r\n  //this function will update the position of all the moving objects,\r\n  //clear the canvas, and redraw them\r\n  var animateCallback = function(){\r\n    this.draw(this.ctx);\r\n    requestAnimationFrame(animateCallback);\r\n\r\n    //if we didn't know about requestAnimationFrame, we could use setTimeout\r\n    //setTimeout(animateCallback, 1000/60);\r\n  }.bind(this);\r\n\r\n  //this will cause the first render and start the endless triggering of\r\n  //the function using requestAnimationFrame\r\n  animateCallback();\r\n};\r\n\r\nGameView.prototype.draw = function() {\r\n  this.ctx.clearRect(0, 0, this.game.xDim, this.game.yDim);\r\n  this.game.moveObjects(this.ctx);\r\n};\r\n\r\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\r\nwindow.GameView = GameView;\r\n\r\ndocument.addEventListener(\"DOMContentLoaded\", function(){\r\n  const myCanvas = document.getElementById(\"game-canvas\");\r\n  const ctx = myCanvas.getContext('2d');\r\n\r\n  let gameView = new GameView(ctx);\r\n\r\n  gameView.start(ctx);\r\n\r\n  // myCanvas.addEventListener(\"click\", event => {\r\n  //   gameView.next(ctx);\r\n  // });\r\n\r\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("/**\r\n * Movign Object class.\r\n *\r\n * @constructor\r\n * @param {Object} optObj - options for moving object.\r\n */\r\n\r\nfunction MovingObject(optObj, game) {\r\n  this.pos = optObj[\"pos\"];\r\n  this.vel = optObj[\"vel\"];\r\n  this.radius = optObj[\"radius\"];\r\n  this.color = optObj[\"color\"];\r\n  this.game = game;\r\n}\r\n\r\nMovingObject.prototype.speak = function() {\r\n  console.log(\"Moving Object can speak\");\r\n}\r\n\r\nMovingObject.prototype.draw = function(ctx) {\r\n  ctx.fillStyle = this.color;\r\n  ctx.beginPath();\r\n\r\n  ctx.arc(\r\n    this.pos[0],\r\n    this.pos[1],\r\n    this.radius,\r\n    0,\r\n    2 * Math.PI,\r\n    false\r\n  );\r\n\r\n  ctx.fill();\r\n}\r\n\r\nMovingObject.prototype.move = function() {\r\n  this.pos[0] += this.vel[0];\r\n  this.pos[1] += this.vel[1];\r\n  this.pos = this.game.wrap(this.pos);\r\n}\r\n\r\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Utils = {\r\n  /**\r\n   * Sets up the inheritance prototype chain.\r\n   * @param {Object} childClass - Child class that inherits from parentClass.\r\n   * @param {Object} parentClass - Parent class that childClass inherits from.\r\n   */\r\n  inherits(childClass, parentClass) {\r\n    let Surrogate = function(){};\r\n    Surrogate.prototype = parentClass.prototype;\r\n    childClass.prototype = new Surrogate();\r\n    childClass.prototype.constructor = childClass;\r\n  },\r\n  /**\r\n   * Gets a random 2d vector\r\n   * @param {Number} length - length/norm of the vector.\r\n   */\r\n  randomVec(length) {\r\n    const deg = 2 * Math.PI * Math.random();\r\n    return Utils.scale([Math.sin(deg), Math.cos(deg)], length);\r\n  },\r\n  /**\r\n   * Gets a random 2d position vector (integers)\r\n   * @param {Number} xLim - X dimension limit (0, xLim).\r\n   * @param {Number} yLim - Y dimension limit (0, yLim).\r\n   */\r\n  randomPos(xLim, yLim) {\r\n    return [Math.floor(Math.random() * xLim), Math.floor(Math.random() * yLim)];\r\n  },\r\n  /**\r\n   * Scales a 2d vector\r\n   * @param {Array} vec - 2D vector to be scaled.\r\n   * @param {Number} m - length to scale the 2d vector by.\r\n   */\r\n  scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n  }\r\n};\r\n\r\nmodule.exports = Utils;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });