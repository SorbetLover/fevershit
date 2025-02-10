import PlayState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import openfl.filters.ShaderFilter;
import funkin.backend.shaders.WiggleEffect.WiggleEffectType;
import funkin.backend.shaders.WiggleEffect;
import openfl.filters.ShaderFilter;
import funkin.editors.charter.Charter;
import flixel.group.FlxSpriteGroup;
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

var d1;
var d2;
var d3;
var d4;
var d5;
var d6;

var gifspr:FunkinSprite;

var joinUs:FlxSprite;
var dedsecshit:FlxSpriteGroup;
function create()
{
	// dddd = 1;
	// for(i in [d1,d2,d3,d4,d5,d6]){
	// 	// trace("D(");
	// 	i = FlxG.bitmap.add(Paths.image("dedsec/dedsecgif" + dddd));
	// 	dddd += 1;
	// }

	Paths.getSparrowAtlas("dedsec/dedsecgif1");
	Paths.getSparrowAtlas("dedsec/dedsecgif2");
	Paths.getSparrowAtlas("dedsec/dedsecgif3");
	Paths.getSparrowAtlas("dedsec/dedsecgif4");
	Paths.getSparrowAtlas("dedsec/dedsecgif5");
	Paths.getSparrowAtlas("dedsec/dedsecgif6");
	dedsecshit = new FlxSpriteGroup();
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


	screen = new CustomShader("camDupe");
	screen.multi = 1;
	// insert(members.indexOf(gf), clap);
	// insert(members.indexOf(gf), spr);
	// insert(members.indexOf(gf), spr2);
// FlxG.camera.addShader(BW);
	// FlxG.camera.addShader(screen);
	// camHUD.addShader(screen);
	// camHUD.addShader()

		wigouwigouwigou = new WiggleEffect();
		wigouwigouwigou.effectType = WiggleEffectType.DREAMY;
		wigouwigouwigou.waveAmplitude = 0.015;
		wigouwigouwigou.waveFrequency = 2;
		wigouwigouwigou.waveSpeed = 1;

var ssssss = 1;
	if(PlayState.difficulty == "dogs"){
		
		// for(i in [d1,d2,d3,d4,d5,d6]){
			// 	i = new FunkinSprite();
			// 	i.frames = Paths.getSparrowAtlas("dedsec/dedsecgif" + ssssss);
			// 	i.animation.addByPrefix("idle", "idle", 12, true);
			// 	i.playAnim("idle");
			// 	// add(i);
			// 	insert(members.indexOf(dad) + 1, i );
			// 	// i.cameras = [camHUD];
			// 	ssssss += 1;
			// 	i.visible = false;
			// 	i.scrollFactor.set(0,0);
			// 	i.x += 500;
			// 	i.y += 200;
			// 	i.alpha = 0;
			// 	if(FlxG.random.bool(40)){
			// 		i.alpha = 1;
			// 	}
			// }
		gifspr = new FunkinSprite();
		gifspr.frames = Paths.getSparrowAtlas("dedsec/dedsecgif" + FlxG.random.int(1,6));
		gifspr.animation.addByPrefix("idle", "idle", 12, true);
		gifspr.playAnim("idle");
					insert(members.indexOf(dad) + 1, gifspr );

					gifspr.x += 450;

					gifspr.alpha = 0;

		joinUs = new FunkinSprite();
		joinUs.frames = Paths.getSparrowAtlas("dedsec/joinUs");
		add(joinUs);
		joinUs.animation.addByPrefix("idle", "joinUs idle", 20, false);
		joinUs.cameras = [camHUD];
		joinUs.setGraphicSize(FlxG.width, FlxG.height);
		joinUs.screenCenter();
		joinUs.visible = false;
		// joinUs.antialiasing = true;
	}
	
}
function postCreate(){
	// insert(members.indexOf(strumLines.members[0].members[0]) + 1, spr);
	// insert(members.indexOf(strumLines.members[0].members[0]), spr2);
	spr.cameras = [camHUD];
	spr2.cameras = [camHUD];

	remove(strumLines);
	insert(100, strumLines);
	if(PlayState.difficulty == "dogs"){
		dad.scale.set(0.7,0.7);
		boyfriend.scale.set(0.7,0.7);
		boyfriend.x -= 600;
		boyfriend.y -= 480;
		dad.x -= 500;
		dad.y -= 450;
		stage.getSprite("alleyway").x += 150;
		stage.getSprite("alleyway").y += 50;	
	}
	

}
var prevDad:Bool = true;


var fireOnce:Bool = false;
var uh:Float = 1;

function postUpdate(elapsed:Float)
{
	// camGame.zoom = 0.5;
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
var curdsc:Int = 0;
function changegif(){
	var asd = FlxG.random.int(1,6);
	if(asd == curdsc){
		changegif();
		return;
	}
	curdsc = asd;
		gifspr.frames = Paths.getSparrowAtlas("dedsec/dedsecgif" + asd);
		gifspr.animation.addByPrefix("idle", "idle", 12, true);
		gifspr.playAnim("idle");
}
function beatHit(curBeat)
{
	if(curBeat % 4 == 0){
		changegif();
	}
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
			FlxG.camera.addShader(screen);
	camHUD.addShader(screen);

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
		// clocks.shader = 
		camGame.followLerp = 0.06;
				gifspr.alpha = 0;

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

		joinUs.visible = true;
		joinUs.playAnim("idle");
		if(PlayState.difficulty != "dogs") FlxTween.num(1, 2, Conductor.crochet / 500, {ease:FlxEase.expoOut}, function(num){
			screen.multi = num;
		});
	}

	if(curStep == 762){
		stage.getSprite("clocks").shader = BW;
		BW.u_colorFactor = -1;
	}
	if(curStep == 768){
		FlxTween.num(1, 2, Conductor.crochet / 500, {ease:FlxEase.expoOut}, function(num){
			screen.multi = num;
		});
		joinUs.visible = false;
		gifspr.alpha = 1;
		
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