import PlayState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import openfl.filters.ShaderFilter;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;

var BLACK_BAR_HEIGHT:Int = 115;
var spr:FlxSprite;
var spr2:FlxSprite;
var clap:FlxSprite;
var prevScore:String = "";
var prevHealth:Float = 1;
var prevTime:Float = 0;
var BW:CustomShader;
var help:FlxText;
var clocks:FlxSprite;
var screen:CustomShader;
var bgElements = [clap, spr, spr2];

var wigouwigouwigou:WiggleEffect;
function create()
{
		clap = new FlxSprite(dad.x - 270, dad.y - 50);
	clap.frames = Paths.getSparrowAtlas("characters/scarlet/Scarlet_Final_Clap");
	clap.animation.addByPrefix("clap", "Final scarlet slap", 24, false);
	clap.antialiasing = true;
	add(clap);
	clap.visible = false;


	
	spr = new FlxSprite(0, 0).makeGraphic(1280, BLACK_BAR_HEIGHT, FlxColor.BLACK);
	add(spr);
	spr.visible = false;

	spr2 = new FlxSprite(0, FlxG.height - BLACK_BAR_HEIGHT).makeGraphic(1280, BLACK_BAR_HEIGHT, FlxColor.BLACK);
	add(spr2);
	spr2.visible = false;

	
	BW = new CustomShader("BWShader");
	BW.u_colorFactor = 0;


	stage.getSprite("alleyway").shader = BW;
	screen = new CustomShader("camDupe");
	screen.multi = 1;
	// insert(members.indexOf(gf), clap);
	// insert(members.indexOf(gf), spr);
	// insert(members.indexOf(gf), spr2);
	FlxG.camera.addShader(screen);
	camHUD.addShader(screen);
	// camHUD.addShader()

		wigouwigouwigou = new WiggleEffect();
		wigouwigouwigou.effectType = WiggleEffectType.DREAMY;
		wigouwigouwigou.waveAmplitude = 0.015;
		wigouwigouwigou.waveFrequency = 2;
		wigouwigouwigou.waveSpeed = 1;


}
function postCreate(){
	// insert(members.indexOf(strumLines.members[0].members[0]) + 1, spr);
	// insert(members.indexOf(strumLines.members[0].members[0]), spr2);
	spr.cameras = [camHUD];
	spr2.cameras = [camHUD];

	remove(strumLines);
	insert(100, strumLines);

}
var prevDad:Bool = true;


var fireOnce:Bool = false;
var uh:Float = 0;

function postUpdate(elapsed:Float)
{
	wigouwigouwigou.update(elapsed * 5);
	BW.u_colorFactor = uh;
	if (curBeat >= 192 && curBeat <= 255)
	{
		// PlayState.songPosBar = prevTime;
		iconP1.scale.set(1, 1);
		iconP2.scale.set(1, 1);
		scoreTxt.scale.set(1, 1);
		scoreTxt.text = prevScore;
		health = prevHealth;
		scoreTxt.x = (FlxG.width / 2) - (scoreTxt.width / 2);
	}
	else if (curBeat == 256 && !fireOnce)
	{
		fireOnce = true;
		// updateScoring(false);
	}
}
function beatHit(curBeat)
{
	if (curBeat < 192 && curBeat > 256)
	{
		if (curBeat >= 64 && curBeat < 128)
			camGame.zoom += 0.04;
		else if (curBeat % 4 == 0)
			camGame.zoom += 0.012;
	}

	if (curBeat == 191)
	{
		clap.shader = BW.shader;
		spr.shader = BW.shader;
		spr2.shader = BW.shader;
		// FlxTween.tween(BW, {u_colorFactor: 1}, Conductor.crochet / 1000);
		FlxTween.num(0, 1, Conductor.crochet / 1000, {ease: FlxEase.linear}, function(uhb:Float):Void{
			uh = uhb;
		});
	}

	if (curBeat == 192)
	{
		defaultCamZoom -= 0.2;
		disableCamera = false;
		clap.visible = false;
		dad.visible = true;

		spr.visible = true;
		spr2.visible = true;
		defaultCamZoom += 0.35;
		camGame.followLerp = 1000;
		camHUD.addShader(wigouwigouwigou.shader);
		// camHUD.setFilters([screen.shader, wigouwigouwigou.shader]);
		camGame.zoom = FlxG.state.defaultCamZoom;

		// onMoveCamera(true);

		// for (i in 0...4)
		// 	strumLineNotes[i].alpha = 0.43;

		prevScore = scoreTxt.text;
		prevHealth = health;
		prevTime = PlayState.songPosBar;

		// currentTimingShown.alpha = 0;
		// forceComboPos = new FlxPoint(FlxG.width * 1.5, 0);
	}
	else if (curBeat == 256)
	{
		// screen.multi = 1;
		FlxTween.num(screen.multi, 1, Conductor.crochet / 10000, {ease:FlxEase.expoOut}, function(num){
			screen.multi = num;
		});
		// snapCamera(DAD_CAM_POS);
		// forceComboPos.set(0, 0);
		FlxTween.tween(spr, {y: -BLACK_BAR_HEIGHT}, 0.24);
		FlxTween.tween(spr2, {y: FlxG.height}, 0.24);
		defaultCamZoom -= 0.35;

		camGame.followLerp = 0.06;
		// getGlobalVar("whittyBG").shader = null;

		// for (i in 0...4)
		// 	strumLineNotes[i].alpha = 1;

		// for (i in getGlobalVar("bgElements"))
		// {
		// 	i.shader = null;
		// }

		// getGlobalVar("bgElements")[0].shader = getGlobalVar("shader");
	}
}

function stepHit(curStep:Int)
{
	if (curStep == 762)
	{
		clap.visible = true;
		dad.visible = false;
		disableCamera = true;
		camFollow.x -= 250;
		defaultCamZoom += 0.2;

		clap.animation.play("clap");
		FlxTween.num(1, 2, Conductor.crochet / 500, {ease:FlxEase.expoOut}, function(num){
			screen.multi = num;
		});
	}
}

function onPlayerNoteHit(note)
{
	if (curBeat >= 192 && curBeat <= 255)
		health = prevHealth;
}

var prevDad:Bool = true;

function onCameraMove(event)
{
	if (curBeat >= 196 && curBeat < 256)
	{
		// dad.visible = true;

		if (curCameraTarget == 0)
		{
			prevDad = true;
			camFollow.setPosition(dad.cameraOffset.x - 70, dad.cameraOffset.y - 70);
		}
		else
		{
			if (prevDad){
				// screen.multi += 1;
				FlxTween.num(screen.multi, screen.multi + 1, Conductor.crochet / 5000, {ease:FlxEase.expoOut}, function(num){
					screen.multi = num;
				});
			}
			prevDad = false;
			// snapCamera(new FlxPoint(BF_CAM_POS.x + 70, BF_CAM_POS.y + 165));
			camFollow.setPosition(boyfriend.cameraOffset.x + 70, dad.cameraOffset.y + 70);
			// dad.visible = false;
		}
	}
}