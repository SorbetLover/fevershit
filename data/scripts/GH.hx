function postCreate(){
    // character.x += 100;
    // character.angle = 20;
    // FlxG.camera.target = character;
    // character.scroll.set(0,0);
    // character.screenCenter();
    // FlxG.camera.snapToTarget();
    character.y -= 100;
    FlxG.camera.followLerp = 360;
}

function beatHit(curBeat){
    __cancelDefault = true;
    Conductor.changeBPM(100);
    if(curBeat % 2 == 0){
        character.playAnim("deathLoop", true);
    }
}
function update(){
        character.danceOnBeat = false;
        if (controls.ACCEPT)
		{
			endBullshit();
		}
}