import haxe.ds.ObjectMap;
import haxe.ds.StringMap;
import haxe.Json;
import sys.io.File;
import funkin.backend.assets.ModsFolder;

import funkin.backend.chart.Chart;
import flixel.groups.FlxSpriteGroup;

import flixel.text.FlxTextAlign;
var isFrenzy:Bool = false;
// image - songs[icon]
var weeks:Array = [
	["week1", 
		["Milk-Tea", "gf"],
		["Peastep", "peakek"],
		["Eros", "peakek"],
		["Down-Horrendous", "peasus"]
	],
	["week2",
		["Star-Baby", "wee"],
		["Last-Meow", "weeferal"],
		["Bazinga", "taki"],
		["Crucify", "taki"]
	],
	["weektaki",
		["Prayer", "taki"], 
		["Bad-Nun", "taki"]
	],
	["week3",
		["Mako", "mako"], 
		["VIM", "mako"], 
		["Retribution", "mako-demon"]
	],
	["week4", 
		["Honey", "hunni"], 
		["Bunnii", "hunni"], 
		["Throw-It-Back", "hunni"]
	],
	["week5",
		["Mild", "pepper"], 
		["Spice", "pepper"], 
		["Party-Crasher", "yukichi"]
	],
	["week6",
		["Ur-Girl", "mega-real"],
		["Chicken-Sandwich", "mega-real"],
		["Funkin-God", "flippy-real"]
	],
	["extras",
		["Metamorphosis", "peakek"],
		["Void", "peakek"],
		["Down Bad", "peakek"],
		["Farmed", "mako-demon"],
		["Space-Demons", "bf-old"],
		["Old-Hardships", "tea-bat"]
	]
];

var weeksFrenzy:Array = [
	["week7", ["Preparation", "gf"],
		["C354R", "robo-cesar"],
		["Loaded", "robo-cesar"],
		["Gears", "roboff"]
	],
	["week8",
		["Tranquility", "scarlet"],	
		["Princess", "scarlet"],
		["Crack", "scarlet"],
		["Bloom", "scarlet-final"]
	],
	["weekhallow",
		["Hallow", "hallow"],
		["Eclipse", "hallow"],
		["SOUL", "hallow"],
		["Dead-Mans-Melody", "toothpaste"]
	],
	["weekminus",
		["Grando", "robo-cesar"], 
		["Feel-The-Rage", "taki"]
	],
	["week9", 
		["DUI", "rolldog"],
		["Cosmic-Swing", "rolldog"],
		["Cell-From-Hell", "rolldog"],
		["W00F", "rolldog"]
	],
	["extras",
		["Hardships", "tea-bat"],
		["Erm...", "pepper"],
		["Mechanical", "scarlet"],
		["Shadow", "shadow"],
		["Old-Hallow", "hallow"],
		["Old-Portrait", "hallow"],
		["Old-Soul", "hallow"]
	]

];

function new(frenzyM:Bool = false){
	isFrenzy = FlxG.save.data.Fmenu;
	// trace(FlxG.save.data.Fmenu + " " + isFrenzy);
}
var body:FunkinSprite;
var header:FunkinSprite;
var footer:FunkinSprite;

var offs:Float = 0;
var finishedAnim:Bool = false;

var offsetShit:ObjectMap<Float>;
var coveroffsetShit:StringMap<Float>;
var ofsobj:FlxSprite;

var songGRP:FlxSpriteGroup;
var iconGRP:FlxSpriteGroup;
var asdasd:FlxSprite;
var songlist:Array = [];
function create(){

	for (file in Paths.getFolderDirectories('songs')) {
		var uh = file.toString();
		songlist.push(uh);
	}


	// trace(songlist);
	offsetShit = new ObjectMap();
	coveroffsetShit = new StringMap();
	songGRP = new FlxSpriteGroup();
	iconGRP = new FlxSpriteGroup();

	coveroffsetShit.set("week7", 100);
	coveroffsetShit.set("week8", 485);
	coveroffsetShit.set("weekhallow", 810);
	coveroffsetShit.set("weekminus", 1200);
	coveroffsetShit.set("week9", 1580);
	coveroffsetShit.set("extras", 1960);

	coveroffsetShit.set("week1", 100);
	coveroffsetShit.set("week2", 475);
	coveroffsetShit.set("weektaki", 810);
	coveroffsetShit.set("week3", 1200);
	coveroffsetShit.set("week4", 1580);
	coveroffsetShit.set("week5", 1960);
	coveroffsetShit.set("week6", 1960);


	ofsobj = new FunkinSprite(0, 200);
	// trace(ofsobj.y);


	body = new FunkinSprite();
	setupSpr(body, "body", 1.8, isFrenzy ? 182 : 240);
	body.screenCenter();
	body.y = FlxG.height / body.height / 2 + 40;

	header = new FunkinSprite();
	setupSpr(header, isFrenzy ? "header frenzy" : "header classic", 1.803,2);
	header.screenCenter();
	header.x += 1;
	header.y = body.y;

	footer = new FunkinSprite();
	setupSpr(footer, "footer", 1.8, 2);
	footer.screenCenter();
	footer.y = body.y + body.height - 5;


	var sad:Int = 0;
	for(i in 0...(isFrenzy ? weeksFrenzy.length : weeks.length)){
		setupCover(isFrenzy ? weeksFrenzy[i][0] : weeks[i][0], sad);
		sad += 1;
		var ff = 0;
	}
	// weeksFrenzy[num] IS WEEK NAME AND SONG NAMES 						[week7, [song,icon], [song, icon]];
	// weeksFrenzy[num][songData] IS SONG DATA CONTAINING NAME AND ICON 	[song,icon];
	// weeksFrenzy[num][songData][song or icon]

	// trace(weeksFrenzy[0][1][0]);
	switch(isFrenzy){
		case true:
			for(q in 0...weeksFrenzy.length){
				for(w in 0...weeksFrenzy[q].length){
					for(e in 0...weeksFrenzy[q][w].length - 1){	
						if(w != 0) {
							var ughy:Float = 0;
							// trace(weeksFrenzy[q][w][e]);
							// trace(q + weeksFrenzy[q][0]);
							switch(weeksFrenzy[q][w][0].toLowerCase()){
								case "preparation": ughy = 100;
								case "c354r": ughy = 170;
								case "loaded": ughy = 240;
								case "gears": ughy = 330;
								
								case "tranquility": ughy = 460;
								case "princess": ughy = 530;
								case "crack": ughy = 600;
								case "bloom": ughy = 680;

								case "hallow": ughy = 820;
								case "eclipse": ughy = 890;
								case "soul": ughy = 960;
								case "dead-mans-melody": ughy = 1030;

								case "grando": ughy = 1300;
								case "feel-the-rage": ughy = 1370;

								case "dui": ughy = 1580;
								case "cosmic-swing": ughy = 1660;
								case "cell-from-hell": ughy = 1730;
								case "w00f": ughy = 1800;

								case "hardships": ughy = 1950;
								case "erm...": ughy = 2020;
								case "mechanical": ughy = 2090;
								case "shadow": ughy = 2160;
								case "old-hallow": ughy = 2230;
								case "old-portrait": ughy = 2300;
								case "old-soul": ughy = 2370;

							}
							setupSong(weeksFrenzy[q][w][0], q, ughy, weeksFrenzy[q][w][1]);
						}
					}
				}
			}
			case false:
			for(q in 0...weeks.length){
				for(w in 0...weeks[q].length){
					for(e in 0...weeks[q][w].length - 1){	
						if(w != 0) {
							var ughy:Float = 0;
							// trace(weeksFrenzy[q][w][e]);
							// trace(q + weeksFrenzy[q][0]);
							switch(weeks[q][w][0].toLowerCase()){
								case "milk-tea": ughy = 100;
								case "peastep": ughy = 170;
								case "eros": ughy = 240;
								case "down-horrendous": ughy = 310;

								case "star-baby": ughy = 460;
								case "last-meow": ughy = 530;
								case "bazinga": ughy = 600;
								case "crucify": ughy = 670; 

								case "prayer": ughy = 920;
								case "bad-nun": ughy = 990;

								case "mako": ughy = 1250;
								case "vim": ughy = 1320;
								case "retribution": ughy = 1390;

								case "honey": ughy = 1680;
								case "bunnii": ughy = 1750;
								case "throw-it-back": ughy = 1820;

								case "mild": ughy = 2080;
								case "spice": ughy = 2150;
								case "party-crasher": ughy = 2220;

								case "ur-girl": ughy = 2420 + 50;
								case "chicken-sandwich": ughy = 2490 + 50;
								case "funkin-god": ughy = 2560 + 50;

								case "metamorphosis": ughy = 2800;
								case "void": ughy = 2870;
								case "down bad": ughy = 2940;
								case "farmed": ughy = 3010;
								case "space-demons": ughy = 3080;
								case "old-hardships": ughy = 3150;
								

							}
							setupSong(weeks[q][w][0], q, ughy, weeks[q][w][1]);
						}
					}
				}
			}
	}

		
		asdasd = new FlxSprite().makeGraphic(7000,10);
		add(asdasd);
		asdasd.y = FlxG.height / 2;
		asdasd.visible = false;
	for(d in members){
		if(d != body) d.antialiasing = true;
		offsetShit.set(d, d.y);
	
	}
	// FlxTween.tween(ofsobj, {y: 0}, 1, {ease: FlxEase.elasticOut, onComplete: function(uh:FlxTween){
	// 	finishedAnim = true;
	// }});
		finishedAnim = true;
		// asdasd.y = 10;

	uiui = new FlxText(100,100, 1000, "Press [ALT] to hear the instrumental.", 10);
	add(uiui);
	uiui.antialiasing = true;
	uiui.setFormat(Paths.font("Funkin.otf"), 20);

}

function setupSpr(obj, anim, x, y){
	obj.frames = Paths.getFrames("f/freeplay/menu");
	obj.animation.addByPrefix(anim,anim);
	obj.playAnim(anim); 
	add(obj);
	obj.scale.set(x,y);
	obj.updateHitbox();

}
var coverSide:Bool = true;
var coverstartoff = 200;
var coveroff = 300;

function setupCover(anim, sad){
	// trace(coverSide);
	
	obj = new FunkinSprite();
	obj.frames = Paths.getFrames("f/freeplay/menu");
	obj.animation.addByPrefix(anim,anim);
	obj.playAnim(anim); 
	obj.scale.set(1.8,1.8);
	obj.updateHitbox();
	obj.screenCenter(FlxAxes.X);
	obj.x += (coverSide ? -200 : 200);
	coverSide = !coverSide;
	obj.y = header.y;
	obj.y += 100 + (coveroffsetShit.get(anim));
	// obj.y += obj.height;
	add(obj);
	if(isFrenzy)	switch(sad){
		case 1: obj.x -= 5;
		case 3: obj.x -= 5;
		case 5: obj.x -= 5;
	}
	if(!isFrenzy) switch(sad){
		case 5: obj.y += 50;
		case 6: obj.x = 270; obj.y += obj.height + 70;
		case 7: obj.x = 650; obj.y += obj.height * 2 + 120;
			
	}
	// trace(obj);
}

var dir:Bool = true;
function setupSong(name, weeklenght, uy, iconn){
	if(weeklenght % 2 == 0){
		dir = true;
	} else {
		dir = false;
	}
	song = new FlxText(dir ? 610 : 120, 150 + uy , 500, name, 40);
	song.fieldHeight = 300;
	switch(song.text.toLowerCase()){
		case "hallow", "eclipse", "soul", "dead-mans-melody": song.x += 10;
		case "grando", "feel-the-rage": song.x += 10;
		case "dui", "cosmic-swing", "cell-from-hell", "w00f": song.x += 10;

		case "star-baby", "last-meow", "bazinga", "crucify": song.x += 20;
		case "prayer", "bad-nun": song.x += 20;
		case "mako", "vim", "retribution": song.x += 30;
		case "honey", "bunnii", "throw-it-back": song.x += 30;
		case "mild", "spice", "party-crasher": song.x += 10;
		case "ur-girl", "chicken-sandwich", "funkin-god": song.x += 40;
	}
	song.setFormat(Paths.font("Funkin.otf"), 40, FlxColor.WHITE);
	song.alignment = dir ? FlxTextAlign.LEFT : FlxTextAlign.RIGHT;
	add(song);

	song.updateHitbox();
	
	// trace(iconn);
	icon = new HealthIcon(iconn, false);
	add(icon);
	icon.scale.set(0.6,0.6);
	icon.y = song.y - 20;
	icon.updateHitbox();
	// icon.x = song.x + song.width - (dir ? -song.text.length * 10 : song.text.length * 10);
	switch(dir){
		case false:
		icon.x = 400 + song.x - (song.text.length * 16) - 10;
		case true:
		icon.x = icon.width / 2 + song.x + (song.text.length * 16) - 10;
	}

	switch(song.text.toLowerCase()){
		case "preparation": icon.x -= 10;
		case "c354r": icon.x += 10;
		case "gears": icon.x -= 20;
		case "crack": icon.x -= 10;
		case "hallow", "eclipse": icon.x -= 20;
		case "dead-mans-melody":icon.x += 30;
		case "grando": icon.x -= 5; icon.y -= 10;
		case "feel-the-rage": icon.x -= 20;
		case "dui", "cell-from-hell", "w00f": icon.x -= 20;
		case "cell-from-hell": icon.x -= 10;
		case "shadow": icon.y -= 10; icon.x -= 10;
		case "erm...": icon.x += 10;

		case "peastep": icon.x -= 10;
		case "eros": icon.x -= 25;
		case "down-horrendous": icon.x += 15;
		case "star-baby": icon.x -= 10;
		case "last-meow": icon.x -= 20;
		case "crucify": icon.x += 8;
		case "prayer": icon.x -= 10;
		case "retribution": icon.x += 10;
		case "honey": icon.x -= 20;
		case "bunnii": icon.x -= 30;
		case "throw-it-back": icon.x += 20;
		case "mild":icon.x += 20;
		case "spice": icon.x += 10;
		case "party-crasher": icon.x -= 20;
		case "ur-girl": icon.x -= 30;
		case "chicken-sandwich": icon.x += 20;	
		case "metamorphosis": icon.x -= 10;
		case "down bad": icon.x -= 15;
		case "space-demons": icon.x -= 30; icon.y -= 10;
	}

	songGRP.add(song);
	iconGRP.add(icon);
	
}

var curSelected:Int = 0;
var lastSelected = 0;
var cursong:String;
function update(elapsed){
	cursong = songGRP.members[curSelected].text.toLowerCase();
	// offs += FlxG.mouse.wheel * 100;
	// if(finishedAnim == false){	offs = ofsobj.y;}
	// if(FlxG.keys.justPressed.S && finishedAnim == true){
	// 	offs -= 30;
	// }
	// if(FlxG.keys.justPressed.W && finishedAnim == true){
	// 	offs += 30;
	// }
	if(FlxG.keys.justPressed.S){  curSelected += 1; }
	if(FlxG.keys.justPressed.W){ curSelected -= 1; }
	if(isFrenzy) switch(curSelected){
		case 0, 1: offs = 0;
		case 2: offs = 50;
		case 3: offs = 140;
		case 4: offs = 270;
		case 5: offs = 340;
		case 6: offs = 410;
		case 7: offs = 490;
		case 8: offs = 630;
		case 9: offs = 700;
		case 10:offs = 770;
		case 11:offs = 840;
		case 12:offs = 1110;
		case 13:offs = 1180;
		case 14:offs = 1385;
		case 15:offs = 1470;
		case 16:offs = 1540;
		case 17:offs = 1600;
		case 18:offs = 1760;
		case 19:offs = 1830;
		case 20:offs = 1900;
		// case 21:offs = 1970;
		// case 22:offs = 2040;
		// case 23:offs = 2110;
		// case 24:offs = 2180;
	}
	if(!isFrenzy) switch(curSelected){
		case 0, 1: offs = 0;
		case 2: offs = 50;
		case 3: offs = 120;
		case 4: offs = 270;
		case 5: offs = 340;
		case 6: offs = 410;
		case 7: offs = 480;

		case 8: offs = 730;
		case 9: offs = 800;
		case 10:offs = 1060;
		case 11:offs = 1130;
		case 12:offs = 1200;
		case 13:offs = 1490;
		case 14:offs = 1560;
		case 15:offs = 1630;
		case 16:offs = 1890;
		case 17:offs = 1960;
		case 18:offs = 2030;
		case 19:offs = 2270;
		case 20:offs = 2345;
		case 21:offs = 2420;
		case 22:offs = 2610;
		case 23:offs = 2680;
		// case 24:offs = 2650;
		// case 25:offs = 2720;
		
	}
	// trace(curSelected);
	for(uh in members){
		if(uh != asdasd) uh.y = FlxMath.lerp(uh.y, offsetShit.get(uh) - offs, 0.2); 
		
	}
	for(i in songGRP.members){
		i.color = 0xFF999999;
	}
	for(i in iconGRP.members){
		i.alpha = 0.6;
	}
	if(songlist.contains(songGRP.members[curSelected].text.toLowerCase())) songGRP.members[curSelected].color = 0xFFFFFFFF; else songGRP.members[curSelected].color = 0xFFff3333;
	// trace(songGRP.members[curSelected].text);
	iconGRP.members[curSelected].alpha =1;
	// if(songlist.contains("milk-tea")){
	// 	trace("CU");
	// };
	asdasd.y = FlxG.height / 2;
	
	if(FlxG.keys.justPressed.X){

	}
	if(controls.BACK){
			close();
			FlxG.save.data.INSS = false;
	}
	if(controls.ACCEPT){
		if(songlist.contains(songGRP.members[curSelected].text.toLowerCase())){
			PlayState.loadSong(songGRP.members[curSelected].text, "hard", false, false);
					FlxG.switchState(new PlayState());

		}
	}
	if(FlxG.keys.justPressed.ALT && lastSelected != curSelected){
		lastSelected = curSelected;
		// if(songlist.contains(songGRP.members[curSelected].text.toLowerCase())) 
		// FlxG.sound.playMusic(Paths.inst(songGRP.members[curSelected].text.toLowerCase()));
		// // trace(Json.parse(ModsFolder.currentModFolder + "/songs/" + songGRP.members[curSelected].text.toLowerCase() + "/meta.json" ));]
		// // Conductor.changeBPM(File.getContent(ModsFolder.currentModFolder + "/songs/" + cursong + "/bpm.txt"));
		// Conductor.changeBPM(File.getContent('mods/' + ModsFolder.currentModFolder + '/songs/'+ cursong + '/bpm.txt'));
		// trace("Bpm set to " + Conductor.bpm);
		if(songlist.contains(songGRP.members[curSelected].text.toLowerCase())) 
		FlxG.sound.playMusic(Paths.inst(songGRP.members[curSelected].text.toLowerCase()));
		var merda = Chart.loadChartMeta(songGRP.members[curSelected].text.toLowerCase());
		Conductor.changeBPM(merda.bpm);
		trace(merda.name + " " + merda.bpm);
	}

	uiui.y = 700;
	uiui.x = 0;
}

