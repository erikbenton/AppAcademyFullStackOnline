const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;

let movingObject = new window.MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("game-canvas");
  const ctx = myCanvas.getContext('2d');

  let asteroid = new Asteroid({pos: [60, 60]});
  let game = new Game(myCanvas.width, myCanvas.height);

  movingObject.draw(ctx);
  asteroid.draw(ctx)
  game.start(ctx);

  myCanvas.addEventListener("click", event => {
    game.next(ctx);
  });

});