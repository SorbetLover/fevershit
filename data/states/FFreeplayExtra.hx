import haxe.ds.ObjectMap;
import haxe.ds.StringMap;
import haxe.Json;
import sys.io.File;
import funkin.backend.assets.ModsFolder;

import funkin.backend.chart.Chart;
import flixel.groups.FlxSpriteGroup;

import flixel.text.FlxTextAlign;

var songs = [
	["gears", "SongOne", "scarlet"],
	["tranquility", "SongOneelevatedby2", "wrench"],
	["song2", "Songelevatedby3", "wrench"],
	["-"],
	["song3", "SongThree", "mega"],
	["songd3", "SongThreepart2", "mega"],
	["songd3", "SongThreepart22222", "mega"],
	["-"],
	["song4", "SongFourowo", "aiden"],
	["song4", "SongFouruwu", "aiden"],
	["songd4", "SongFourgay", "aiden"]
];

var curMod = 0;


var membs:Array = [];
var membsY:Array = [];
function create(){
	body = new FunkinSprite();
	setupSpr(body, "body", 1.8, 240);
	body.screenCenter();
	body.y = FlxG.height / body.height / 2 + 100;

	header = new FunkinSprite().loadGraphic(Paths.image("f/freeplay/extraheader"));
	// setupSpr(header, "header classic", 1.803,2);
	header.scale.set(1.803, 2);
	header.screenCenter();
	header.x += 1;
	header.y = body.y;
	add(header);

	footer = new FunkinSprite();
	setupSpr(footer, "footer", 1.8, 2);
	footer.screenCenter();
	footer.y = body.y + body.height - 5;
	makeSongs();
	for(i in 0...members.length){
		membs.push(members[i]);
		membsY.push(members[i].y);
	}
	// trace(membsY);
	members.angle = 10;
}
var selec:Int = 0;
var songtexts:Array = [];
var songofffff = [];
function makeSongs() {
	var bolsonaro = 0;
	var AAAAAAAAAAAAAAAAAAAA = 0;
	for (i in 0...songs.length) {
			var songthing = new FlxText(300, 150 + (80 * i), 1000, songs[i][1], 60);
			
			if (i > 0 && songs[i - 1][0] != null && songs[i - 1][0] == "-") {
				bolsonaro -= 40;
				AAAAAAAAAAAAAAAAAAAA -= 40;
			}
			
			songthing.setFormat(Paths.font("Funkin.otf"), 50, FlxColor.WHITE, FlxTextAlign.LEFT);
			songthing.textField.height = 10;
		
			// songthing.y += bolsonaro;

			add(songthing);
			songtexts.push(songthing);
			songofffff.push(AAAAAAAAAAAAAAAAAAAA);
	}
	trace(songofffff);
}

var lastSelected = -1;

function setupSpr(obj, anim, x, y){
	obj.frames = Paths.getFrames("f/freeplay/menu");
	obj.animation.addByPrefix(anim,anim);
	obj.playAnim(anim); 
	add(obj);
	obj.scale.set(x,y);
	obj.updateHitbox();
}
var thepos:Float = 0;
function update(){
	if(FlxG.keys.justPressed.ALT && lastSelected != selec){
			plaything();
	}

	thepos = FlxMath.lerp(thepos, 120 + (80 * -selec), 0.08);
	if(controls.BACK){
			close();
			FlxG.save.data.INSS = false;
	}
	for(i in 0...members.length){
		membs[i].y = membsY[i] + thepos;
		
	}
	if(FlxG.keys.justPressed.W){
		selec -= 1;
		if(songs[selec][0] == "-"){ selec -= 1;}
	}
	if(FlxG.keys.justPressed.S){
		selec += 1;
		if(songs[selec][0] == "-"){ selec += 1;}
	}
	for(i in 0...songtexts.length){
		if(songtexts[i] != null) songtexts[i].color = 0xFF222222;
	}
	if(songtexts[selec] != null) songtexts[selec].color = 0xFFFFFFFF;
	}

function plaything(){
	
		lastSelected = selec;
		FlxG.sound.playMusic(Paths.inst(songs[selec][0]));
		var merda = Chart.loadChartMeta(songs[selec][0]);
		Conductor.changeBPM(merda.bpm);
		trace(merda.name + " " + merda.bpm);
}