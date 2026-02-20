var dadx = 0;
var delta = 0;
function postCreate(){
	if(PlayState.difficulty == "alt"){
	dad.y += 150; dad.x -= 300; dad.scale.set(1.3,1.3);
		
	} 
	dadx = dad.x;

}
function update(elapsed){

	if(PlayState.difficulty == "alt") return;
	dad.x = dadx + 50 * Math.sin(delta);
	if(dad.animation.curAnim.name == "idle"){
		delta += elapsed * 5;
	}
}