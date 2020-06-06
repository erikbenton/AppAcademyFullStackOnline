console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

let movingObject = new window.MovingObject({
  pos: [30, 30],
  vel: [10, 10],
  radius: 5,
  color: "#00FF00"
});

document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("game-canvas");
  const ctx = myCanvas.getContext('2d');

  movingObject.draw(ctx);

  myCanvas.addEventListener("click", event => {
    ctx.clearRect(0, 0, myCanvas.width, myCanvas.height);
    movingObject.move();
    movingObject.draw(ctx);
  });

});