import flixel.util.FlxTimer;
import flixel.util.FlxTween;
function postCreate(){

strumLines.members[2].characters[1].alpha = 0;


    
	    FlxG.sound.play(Paths.sound('stoneslide'));
		FlxTween.tween(dad, {x: 360}, 1.8, {ease:FlxEase.cubeOut});
		new FlxTimer().start(1.37, function(tmr:FlxTimer)
			{
				hand1.alpha = 1;
			

		});
		new FlxTimer().start(1.8, function(tmr:FlxTimer)
		{
		hand1.animation.play('shit2');
		});
		
			dad.playAnim('shit');

		
}
// function onStartSong(){
	// strumLines.members[2].members[0].y = 600;
	// strumLines.members[2].members[1].y = 600;
	// strumLines.members[2].members[2].y = 600;
	// strumLines.members[2].members[3].y = 600;
    // defaultHudZoom = 0.85;
	// strumLines.members[1].members[0].x += 150;
	// strumLines.members[1].members[1].x += 150;
	// strumLines.members[1].members[2].x += 150;
	// strumLines.members[1].members[3].x += 159;

	// strumLines.members[2].members[0].x += 3120;
	// strumLines.members[2].members[1].x += 3220;
	// strumLines.members[2].members[2].x += 3220;
	// strumLines.members[2].members[3].x += 3220;

	// strumLines.members[0].members[0].x -= 150;
	// strumLines.members[0].members[1].x -= 150;
	// strumLines.members[0].members[2].x -= 150;
	// strumLines.members[0].members[3].x -= 150;


	
	// strumLines.members[2].members[0].alpha = 1;
	// strumLines.members[2].members[1].alpha = 1;
	// strumLines.members[2].members[2].alpha = 1;
	// strumLines.members[2].members[3].alpha = 1;

	// for (strum in strumLines.members[2].members){
	// 	strum.color = 0xFFff0066	;
	// 	   }	   
// }

function stepHit(curStep){
	if(curStep == 885){
	strumLines.members[2].characters[1].alpha = 1;
	strumLines.members[2].characters[0].alpha = 0;
    tabl2.alpha = 0;
	}
}