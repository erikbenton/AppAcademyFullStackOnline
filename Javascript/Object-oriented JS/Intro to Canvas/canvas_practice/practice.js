document.addEventListener("DOMContentLoaded", function(){
  const myCanvas = document.getElementById("mycanvas");
  const ctx = myCanvas.getContext('2d');

  ctx.fillStyle = "rgb(0, 255, 69)";

  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 100, 0, 2 * Math.PI);
  ctx.strokeStyle = 'blue';
  ctx.lineWidth = 10;
  ctx.stroke();

});
