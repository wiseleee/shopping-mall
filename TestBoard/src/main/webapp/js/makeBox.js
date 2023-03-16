var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

var x = 250;
var y = 150;
var speed = 5;

function drawBox() {
	ctx.fillStyle = "#FF0000";
	ctx.fillRect(x, y, 50, 50);
}

function clear() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function update() {
	if (keys[37]) { // left arrow
		if (x > 0) {
			x -= speed;
		}
	}
	if (keys[38]) { // up arrow
		if (y > 0) {
			y -= speed;
		}
	}
	if (keys[39]) { // right arrow
		if (x < canvas.width - 50) {
			x += speed;
		}
	}
	if (keys[40]) { // down arrow
		if (y < canvas.height - 50) {
			y += speed;
		}
	}
}

function gameLoop() {
	clear();
	update();
	drawBox();
	requestAnimationFrame(gameLoop);
}

var keys = {};
window.addEventListener("keydown", function(e) {
	keys[e.keyCode] = true;
}, false);

window.addEventListener("keyup", function(e) {
	delete keys[e.keyCode];
}, false);

gameLoop();