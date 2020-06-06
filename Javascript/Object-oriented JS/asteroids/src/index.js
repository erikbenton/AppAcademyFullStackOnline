const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;

let movingObject = new window.MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

let asteroid = new Asteroid({pos: [60, 60]});

document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("game-canvas");
  const ctx = myCanvas.getContext('2d');

  movingObject.draw(ctx);
  asteroid.draw(ctx)

  myCanvas.addEventListener("click", event => {
    ctx.clearRect(0, 0, myCanvas.width, myCanvas.height);
    movingObject.move();
    asteroid.move();
    movingObject.draw(ctx);
    asteroid.draw(ctx);
  });

});