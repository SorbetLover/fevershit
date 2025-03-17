
import flixel.addons.display.FlxBackdrop;

var norm:Array = [];
var glow:Array = [];
var fall:Array = [];
var fly:Array = [];

// train

var sky:FunkinSprite;
var buildings1:FlxBackdrop;
var buildings2:FlxBackdrop;
var buildings3:FlxBackdrop;
var train:FlxSprite;
var trainGlow:FlxSprite;
// tunnel
var lights:FlxBackdrop;
var fakeTunnelBG:FlxSprite;
// uh
var outerBuilding:FlxSprite;
var bomb:FlxSprite;
var trainDeath:FlxSprite;
var fakeBuilding:FlxSprite;

var phase:Int = 0;
var camPos:Array = [
// phase - offs
    // dad            bf
    [[300,-200], [900,-100]]
];
function create(){
    sky = new FunkinSprite().loadGraphic(Paths.image("stages/roboStage/sky"));
    insert(0, sky);
    sky.y = -800;
	sky.setGraphicSize(Std.int(sky.width * 1.75));

    buildings1 = new FlxBackdrop().loadGraphic(Paths.image('stages/roboStage/gears/furthestBuildings'));
    insert(1, buildings1);
    buildings1.repeatAxes = FlxAxes.X;
    buildings1.setGraphicSize(Std.int(buildings1.width * 1.75));
	buildings1.y -= 50;
	buildings1.x -= 500;

    buildings2 = new FlxBackdrop().loadGraphic(Paths.image('stages/roboStage/gears/middleBuildings'));
    buildings2.spacing.x = -5;
    insert(2, buildings2);
    buildings2.repeatAxes = FlxAxes.X;
    buildings2.setGraphicSize(Std.int(buildings2.width * 1.75));
	buildings2.y -= 250;
	buildings2.x -= 500;

    buildings3 = new FlxBackdrop().loadGraphic(Paths.image('stages/roboStage/gears/frontBuildings'));
    insert(3, buildings3);
    buildings3.repeatAxes = FlxAxes.X;
	buildings3.setGraphicSize(Std.int(buildings3.width * 1.75));
	buildings3.y -= 650;
	buildings3.x -= 500;
	
    fakeBuilding = new FlxSprite(0, buildings3.y + buildings3.height - 5).makeGraphic(60, 60, 0xFF2E125D);
	fakeBuilding.origin.set(0, 0);
	fakeBuilding.scale.set(100, 100); // is this legal
    insert(4, fakeBuilding);
    fakeBuilding.updateHitbox();
    fakeBuilding.y = buildings3.y + 940;
    fakeBuilding.x -= 2000;


    tunnelBG = new FlxBackdrop().loadGraphic(Paths.image('stages/roboStage/gears/tunnel'));
	tunnelBG.antialiasing = true;
	tunnelBG.y -= 950;
	tunnelBG.setGraphicSize(Std.int(tunnelBG.width * 1.15));
	tunnelBG.color = 0xFFA672B2;
	add(tunnelBG);
	tunnelBG.visible = false;

	lights = new FlxBackdrop().loadGraphic(Paths.image('stages/roboStage/gears/lights'));
	lights.antialiasing = true;
	lights.y -= 700;
	lights.setGraphicSize(Std.int(lights.width * 1.6));
	add(lights);
	lights.visible = false;
    lights.repeatAxes = FlxAxes.X;
    lights.velocity.x = -10000;


    train = new FlxSprite(0,0);
    train.frames = Paths.getSparrowAtlas("stages/roboStage/train");
    
    train.animation.addByPrefix('drive', "all train", 24, false);
	train.animation.play('drive');
	train.scrollFactor.set(0.9, 0.9);
	train.setGraphicSize(Std.int(train.width * 1.75));
    train.x = 0;
    train.updateHitbox();
    add(train);
    // insert(train, 8);
    train.y = 400;
    train.x = -1800;

    
    trainGlow = new FlxSprite(0,0);
    trainGlow.frames = Paths.getSparrowAtlas("stages/roboStage/trainGlow");
    
    trainGlow.animation.addByPrefix('drive', "all train", 24, false);
	trainGlow.animation.play('drive');
	trainGlow.scrollFactor.set(0.9, 0.9);
	trainGlow.setGraphicSize(Std.int(trainGlow.width * 1.75));
    trainGlow.x = 0;
    trainGlow.updateHitbox();
    add(trainGlow);
    insert(members.indexOf(train)+ 1, trainGlow);
    trainGlow.y = 300;
    trainGlow.x = -1750;

	bomb = new FlxSprite(2350, 103.442);
	bomb.frames = Paths.getSparrowAtlas('stages/roboStage/gears/regular_bomb');
    bomb.scrollFactor.set(0.9, 0.9);
	bomb.animation.addByPrefix("idle", "Mako Bomb Normal", 24);
	bomb.animation.play("idle");
	bomb.antialiasing = true;
	bomb.scale.set(1.5, 1.5);
	add(bomb);

    bomb.x = 400;
    bomb.y = -300;


	fakeTunnelBG = new FlxSprite(0, -50).loadGraphic(Paths.image("stages/roboStage/gears/tunnel"));
	fakeTunnelBG.antialiasing = true;
	fakeTunnelBG.x = FlxG.width;
	fakeTunnelBG.color = 0xFF565656;

	tunnelEnterance = new FlxSprite(0, -50).loadGraphic(Paths.image("stages/roboStage/gears/tunnelEnterance"));
	tunnelEnterance.antialiasing = true;
	tunnelEnterance.x = FlxG.width;
    insert(members.indexOf(strumLines.members[0].characters[1]) + 100, tunnelEnterance);
    insert(members.indexOf(strumLines.members[0].characters[1]) + 1, fakeTunnelBG);

    tunnelEnterance.y -= 1300;
    fakeTunnelBG.y  -= 1000;
    fakeTunnelBG.scale.set(1,4);

    tunnelEnterance.x += 2000;
    fakeTunnelBG.x += 2000;


    for(i in [sky, buildings1, buildings2, buildings3, fakeBuilding]){
        i.scrollFactor.set(0.9,0.9);
    }
    var gh = 1;
    for(e in [buildings1, buildings2, buildings3]){
        e.velocity.x = gh * -1000;
        gh++;
    }
    for(ee in [train, strumLines.members[0].characters[0], strumLines.members[1].characters[0]]){
        ee.scrollFactor.set(0.9,0.9);
    }
    trainGlow.visible = false;

    strumLines.members[0].characters[3].visible = false;
}
function prepare(zoom){
    norm.push(strumLines.members[0].characters[0]);
    norm.push(strumLines.members[1].characters[0]);
    glow.push(strumLines.members[0].characters[1]);
    glow.push(strumLines.members[1].characters[1]);
    fall.push(strumLines.members[0].characters[2]);
    fall.push(strumLines.members[1].characters[2]);
    defaultCamZoom = zoom;
    FlxG.camera.zoom = zoom;
}
function postCreate(){
    player.cpu = true;

    prepare(0.32);

    for(i in [0,1]){
        glow[i].visible = false;
        fall[i].visible = false;
    }
    for(o in [strumLines.members[0].characters[0], strumLines.members[1].characters[0]]){
        remove(o);
        insert(members.indexOf(train) + 3, o);
    }
    for(iee in [glow[0], glow[1]]){
        remove(iee);
        insert(members.indexOf(bomb) + 11, iee);
    }

    norm[0].x = -400;
    norm[0].y = -600;
    glow[0].x = -330;
    glow[0].y = -670;
    
    norm[1].x = 1000;
    norm[1].y = -40;
    glow[1].x = 1000;
    glow[1].y = -40;

    
}
var _elased:Float = 0;
function postUpdate(elapsed){
    camFollow.setPosition(camPos[phase][curCameraTarget][0], camPos[phase][curCameraTarget][1]);
    _elased += elapsed * Conductor.bpm / 100;
    bomb.y = -300 + 20 * Math.sin(_elased); 

    // lights.angle = 0 + 2 * Math.sin(_elased * 200);

}

function beatHit(curBeat){
	train.animation.play('drive');
	trainGlow.animation.play('drive');
    switch (curBeat)
	{
		case 0:
			camGame.zoom += 0.02;
		case 4:
			camGame.zoom += 0.02;
		case 8:
			camGame.zoom += 0.02;
		case 16:
			// setHUDVisible(true);

        case 205:
            enterTunnel();
        case 271:
            exitTunnel();
	}

	if (curBeat >= 80 && curBeat < 432 && curBeat % 4 == 0)
	{
		camGame.zoom += 0.005;
	}
}

var introBumps:Array<Int> = [40, 49, 57, 59, 60, 61, 62, 63];

function stepHit(curStep:Int)
{
	if (introBumps.contains(curStep))
	{
		FlxG.camera.zoom += 0.02;
	}
}
function enterTunnel()
{
	FlxTween.tween(tunnelEnterance, {x: 0}, 0.3);
	FlxTween.tween(fakeTunnelBG, {x: 0}, 0.3, {
		onComplete: function(t)
		{
			inTunnel = true;
			tunnelEnterance.visible = false;
			fakeTunnelBG.visible = false;
			tunnelBG.visible = true;
			lights.visible = true;
			// poles.visible = false;
			trainGlow.visible = true;
            train.visible = false;
            
            norm[0].visible = false;
            norm[1].visible = false;
            glow[0].visible = true;
            glow[1].visible = true;
			camGame.flash(FlxColor.BLACK, 1.3);
		}
	});
}

function exitTunnel()
{
	tunnelEnterance.visible = true;
	trainGlow.visible = false;
	train.visible = true;

	fakeTunnelBG.visible = true;
	tunnelBG.visible = false;
	lights.visible = false;
	inTunnel = false;
        // tunnelEnterance.y -= 1300;
    // fakeTunnelBG.y  -= 1000;
    fakeTunnelBG.scale.set(8,4);
    remove(fakeTunnelBG);
    insert(members.indexOf(trainGlow) + 1, fakeTunnelBG);
    tunnelEnterance.x += 2000;
    fakeTunnelBG.x += 2000;
    remove(glow[0]);
    insert(members.indexOf(fakeTunnelBG)- 1, glow[0]);
	FlxTween.tween(tunnelEnterance, {x: -400}, 0.1, {
		onUpdate: function(elapsed)
		{
			fakeTunnelBG.x = tunnelEnterance.x - fakeTunnelBG.width;
		},
		onComplete: function(t)
		{
			fakeTunnelBG.visible = false;
			tunnelEnterance.visible = false;
			// poles.visible = true;
            norm[0].visible = true;
            norm[1].visible = true;
            glow[0].visible = false;
            glow[1].visible = false;
		}
	});
}