var dadx = 0;
var delta = 0;
function postCreate(){
	dadx = dad.x;
}
function update(elapsed){
	dad.x = dadx + 50 * Math.sin(delta);
	if(dad.animation.curAnim.name == "idle"){
		delta += elapsed * 5;
	}
}