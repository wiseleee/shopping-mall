var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

let lastTime = 0;
let elapsedTime = 0;


var boxWidth = 50;
var boxHeight = 50;
var boxX = (canvas.width - boxWidth) / 2;
var boxY = canvas.height - boxHeight;
var speed = 5;

var balls = [];
var maxBalls = 10;
var ballRadius = 10;
var ballSpeed = 5;

var gameRunning = false;

var startGameElement = document.getElementById('start-game');
startGameElement.addEventListener('click', function() {
  startGame();
  
});
function drawBox() {
	ctx.drawImage(boxImage, boxX, boxY, boxWidth, boxHeight);
}

var boxImage = new Image();
boxImage.src = "images/leeDD.png";


var ballImage = new Image();
ballImage.src = "images/zzzzkk.png";

function drawBall(ball) {
	ctx.beginPath();
	ctx.drawImage(ballImage, ball.x - ballRadius, ball.y - ballRadius, ballRadius * 2, ballRadius * 2);
	ctx.closePath();
}

function clear() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function updateBox() {
	if (keys[37]) { // left arrow
		if (boxX > 0) {
			boxX -= speed;
		}
	}
	if (keys[39]) { // right arrow
		if (boxX < canvas.width - boxWidth) {
			boxX += speed;
		}
	}
}

function updateBalls() {
	for (var i = 0; i < balls.length; i++) {
		var ball = balls[i];
		ball.y += ballSpeed;
		if (ball.y > canvas.height) {
			balls.splice(i, 1);
			i--;
		} else if (isColliding(boxX, boxY, boxWidth, boxHeight, ball.x - ballRadius, ball.y - ballRadius, ballRadius*2, ballRadius*2)) {
			alert("똥을 피하지 못했습니다!");
			document.location.reload();
			clearInterval(interval);
			return;
		}
	}
	if (balls.length < maxBalls) {
		var ball = {
			x: Math.random() * (canvas.width - ballRadius*2) + ballRadius,
			y: 0
		};
		balls.push(ball);
	}
}

function isColliding(x1, y1, w1, h1, x2, y2, w2, h2) {
	return x1 < x2 + w2 &&
	       x1 + w1 > x2 &&
	       y1 < y2 + h2 &&
	       y1 + h1 > y2;
}

function startGame() {
	gameRunning = true;
	gameLoop(performance.now());
  	startGameElement.parentNode.removeChild(startGameElement);
}

function gameLoop(currentTime) {
	if (!gameRunning) {
		return;
	}
  elapsedTime += currentTime - lastTime;
  lastTime = currentTime;

  clear();
  updateBox();
  updateBalls();
  drawBox();
  for (var i = 0; i < balls.length; i++) {
    drawBall(balls[i]);
  }

  ctx.fillStyle = "#000000";
  ctx.font = "24px Arial";
  ctx.fillText("Time: " + Math.floor(elapsedTime / 1000), 10, 30);

  requestAnimationFrame(gameLoop);
}



var keys = {};
window.addEventListener("keydown", function(e) {
  keys[e.keyCode] = true;
}, false);

window.addEventListener("keyup", function(e) {
  delete keys[e.keyCode];
}, false);

