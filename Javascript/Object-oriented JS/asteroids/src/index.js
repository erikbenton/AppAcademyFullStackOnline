const GameView = require("./game_view.js");
window.GameView = GameView;

document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("game-canvas");
  const ctx = myCanvas.getContext('2d');
  let gameView = new GameView(ctx);
  gameView.start(ctx);
});