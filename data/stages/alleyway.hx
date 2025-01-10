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
	}
}