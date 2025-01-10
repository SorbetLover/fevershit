import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;
var princessBG:FlxSprite;
var princessFloor:FlxSprite;
var princessCrystals:FlxSprite;

var clocks:FlxSprite;
var clockScar:FlxSprite;
var clockFever:FlxSprite;
var wiggleEffect:WiggleEffect;
import flixel.tweens.FlxTweenType;
function create(){
	if (PlayState.instance.curSong.toLowerCase() == 'princess')
	{
		princessBG = new FlxSprite(-446, -611).loadGraphic(Paths.image('stages/roboStage/princessBG'));
		princessBG.antialiasing = true;
		princessBG.scrollFactor.set(0.75, 0.8);
		princessBG.scale.set(1.25, 1.25);
		// add(princessBG);
		princessBG.visible = false;

		princessFloor = new FlxSprite(-446, -611).loadGraphic(Paths.image('stages/roboStage/princessFloor'));
		princessFloor.antialiasing = true;
		princessFloor.scrollFactor.set(0.9, 0.9);
		princessFloor.scale.set(1.25, 1.25);
		// add(princessFloor);
		princessFloor.visible = false;

		princessCrystals = new FlxSprite(-446, -591).loadGraphic(Paths.image('stages/roboStage/princessCrystals'));
		princessCrystals.antialiasing = true;
		princessCrystals.scrollFactor.set(0.9, 0.9);
		princessCrystals.scale.set(1.25, 1.25);
		// add(princessCrystals);
		princessCrystals.visible = false;
		for(i in [princessBG, princessFloor, princessCrystals]){
			insert(members.indexOf(gf), i);
		}
		FlxTween.tween(princessCrystals, {y: princessCrystals.y - 70}, 3.4, {type: FlxTweenType.PINGPONG});
	}
	if (PlayState.instance.curSong.toLowerCase() == "bloom")
	{
		clocks = new FlxSprite(200, 80).loadGraphic(Paths.image("stages/roboStage/princessClocks"));
		clocks.scale.set(2.55, 2.55);
		clocks.antialiasing = true;
		clocks.visible = false;

		clockScar = new FlxSprite(-190, 680).loadGraphic(Paths.image("stages/roboStage/princessClock"));
		clockScar.scale.set(1.65, 1.65);
		clockScar.antialiasing = true;
		clockScar.visible = false;

		clockFever = new FlxSprite(990, 695).loadGraphic(Paths.image("stages/roboStage/princessClock"));
		clockFever.scale.set(1.25, 1.25);
		clockFever.antialiasing = true;
		clockFever.visible = false;

	wiggleEffect = new WiggleEffect();
	wiggleEffect.effectType = WiggleEffectType.DREAMY;
	wiggleEffect.waveAmplitude = 0.01;
	wiggleEffect.waveFrequency = 2;
	wiggleEffect.waveSpeed = 1;

		clocks.shader = wiggleEffect.shader;
		// setGlobalVar("shader", wiggleEffect.shader);
		// setGlobalVar("bgElements", [clocks, clockScar, clockFever]);
		dad.color = 0xFFA569BC;
		boyfriend.color = 0xFFA569BC;
		for(ee in [clocks, clockScar, clockFever]) insert(members.indexOf(gf), ee);
	}
	if(PlayState.instance.curSong == "crack"){
		strumLines.members[0].characters[1].alpha = 0;
	}
	if(PlayState.instance.curSong == "bloom"){
		strumLines.members[0].characters[0].x -= 100;
		strumLines.members[1].characters[0].x += 100;
	}
}

function stepHit(curStep){
	switch (PlayState.instance.curSong.toLowerCase())
	{
		case 'princess':
			if (curStep == 128)
			{
				camHUD.flash(FlxColor.WHITE, 0.5);
				princessBG.visible = true;
				princessFloor.visible = true;
				princessCrystals.visible = true;
				defaultCamZoom = 0.65;
				gf.y += 60;
			}
		case 'bloom':
			if (curStep == 256)
			{
				dad.color = boyfriend.color = FlxColor.WHITE;
				defaultCamZoom = 0.53;
				camHUD.flash(FlxColor.WHITE, 0.5);
				clocks.visible = true;
				clockScar.visible = true;
				clockFever.visible = true;
			}
	
		case "crack":
			if(curStep == 832){
				strumLines.members[0].characters[0].alpha = 0;
				strumLines.members[0].characters[1].alpha = 1;
				dad.cameraOffset = FlxPoint.weak(0,-200);
			}
	}


}