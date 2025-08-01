// originally BroMaster's script, the remaining Ks were added by me (-alloy)

import funkin.game.StrumLine;

var plrX = 90;
var oppX = 0;
var mania = 1;
var rdom = 0;
var holds = true;
var issus = false;

var keyBinds = [
    ["none"],
	["SPACE"],
	["D",	"K"],
	["D", "SPACE" , "K"],
	["D", "F", "J", "K"],
	["A", "S", "SPACE", "K", "L"],
	["A", "S", "D", "J", "K", "L"],
	["A", "S", "D", "SPACE", "J", "K", "L"],
	["A", "S", "D", "F", "H", "J", "K", "L"],
	["A", "S", "D", "F", "SPACE", "H", "J", "K", "L"],
];


var maniaScales = [
	0,
	0.7,
	0.7,
	0.7,
	0.9,
	0.7,
	0.6,
	0.7,
	0.7,
	0.7,
];

var maniaTypes = [
	["none"],
	["green"],
	["purple", "red"],
	["purple", "white", "red"],
	["purple", "blue", "green", "red"],
	["purple", "blue", "white", "green", "red"],
	["purple", "green", "red", "purple", "blue", "red"],
	["purple", "green", "red", "white", "purple", "blue", "red"],
	["purple", "blue", "green", "red", "purple", "blue", "green", "red"],
	["purple", "blue", "green", "red", "white", "purple", "blue", "green", "red"],
];

var singDir = [
	["none"],
	["UP"],
	["LEFT", "RIGHT"],
	["LEFT", "UP", "RIGHT"],
	["LEFT", "DOWN", "UP", "RIGHT"],
	["LEFT", "DOWN", "UP", "UP", "RIGHT"],
	["LEFT", "UP", "RIGHT", "LEFT", "DOWN", "RIGHT"],
	["LEFT", "UP", "RIGHT", "UP", "LEFT", "DOWN", "RIGHT"],
	["LEFT", "UP", "RIGHT", "UP", "LEFT", "UP", "DOWN", "RIGHT"],
	["LEFT", "DOWN", "UP", "RIGHT", "UP", "LEFT", "DOWN", "UP", "RIGHT"],
];

function create() {
	if(FlxG.save.data.keyCount != null){
		mania = FlxG.save.data.keyCount;
	}
	if (mania == 4 || mania == 0 || mania == null) {
		disableScript();
	}

}

function onNoteCreation(e) {
	issus = e.note.isSustainNote;
	if(mania != 6) e.cancel();
	if (!issus) {rdom++;}
	
	e.note.extra.set("dir", e.note.noteData);
	if (mania == 1) {
		// 0 1 2 3
			e.note.noteData = 0;
			
	}
	if (mania == 2) {
		// 0 1 2 3
		if (e.note.noteData == 2) { e.note.noteData = 0;  }
		if (e.note.noteData == 3) { e.note.noteData = 1;  }
		
	}
	if (mania == 3) {
		if (e.note.noteData == 3) { e.note.noteData = 2;  }
		if (e.note.noteData == 4) { e.note.noteData = 3;  }
		
	}
	if (mania == 4) {
		if (e.note.noteData == 1) { e.note.noteData = 4;  }
		if (e.note.noteData == 2) { e.note.noteData = 1;  }
		if (e.note.noteData == 0 && rdom % 2 == 0) { e.note.noteData = 3;  }
		if (e.note.noteData == 3 && rdom % 2 == 0) { e.note.noteData = 5;  }
		if (e.note.noteData == 3) { e.note.noteData = 2;  }
	}
	if (mania == 5) {
		if (e.note.noteData == 0) { e.note.noteData = 0;  }
		if (e.note.noteData == 1) { e.note.noteData = 1;  }
		if (e.note.noteData == 2) { e.note.noteData = 2;  }
		if (e.note.noteData == 3 && rdom % 2 == 0) { e.note.noteData = 4;  }
		if (e.note.noteData == 3) { e.note.noteData = 3;}
	}
	
if (mania == 6) {
		//down note
		if (e.note.noteData == 1) { 
    			e.note.noteData = 4;
			return;
		}
		//up note
		if (e.note.noteData == 2) { 
    			e.note.noteData = 1;
			return;
		}
		//every other left note
		if (e.note.noteData == 0 && rdom % 2 == 0) { 
    			e.note.noteData = 3;
			return;
		}
		//every other right note
		if (e.note.noteData == 3 && rdom % 2 == 0) { 
    			e.note.noteData = 5;
			return;
		}
		//the every other other right note
		if (e.note.noteData == 3) {
		    	e.note.noteData = 2;
			return;
		}
}


if (mania == 7) {
	switch (e.note.noteData) {
		case 0: // left
			e.note.noteData = (rdom % 3 == 0) ? 0 : (rdom % 3 == 1) ? 3 : 6;

		case 1: // down
			e.note.noteData = (rdom % 2 == 0) ? 1 : 4;

		case 2: // up
			e.note.noteData = (rdom % 2 == 0) ? 2 : 5;

		case 3: // right
			e.note.noteData = (rdom % 2 == 0) ? 6 : 3;
	}
}
if (mania == 8) {
	switch (e.note.noteData) {
		case 0: // left
			e.note.noteData = switch (rdom % 3) {
				case 0: 0;
				case 1: 3;
				default: 6;
			}

		case 1: // down
			e.note.noteData = switch (rdom % 3) {
				case 0: 1;
				case 1: 4;
				default: 7;
			}

		case 2: // up
			e.note.noteData = switch (rdom % 2) {
				case 0: 2;
				default: 5;
			}

		case 3: // right
			e.note.noteData = switch (rdom % 2) {
				case 0: 5;
				default: 2;
			}
	}
}
if (mania == 9) {
	switch (e.note.noteData) {
		case 0: // left
			e.note.noteData = switch (rdom % 3) {
				case 0: 0;
				case 1: 3;
				default: 6;
			}

		case 1: // down
			e.note.noteData = switch (rdom % 3) {
				case 0: 1;
				case 1: 4;
				default: 7;
			}

		case 2: // up
			e.note.noteData = switch (rdom % 2) {
				case 0: 2;
				default: 5;
			}

		case 3: // right
			e.note.noteData = switch (rdom % 2) {
				case 0: 8;
				default: 2;
			}
	}
}


	if (!holds && e.note.isSustainNote) {
		e.note.noteData = 1000;
	}
	if(mania != 6 ) { var note = e.note;
	note.frames = Paths.getFrames("game/shaggyNotes");
	note.animation.addByPrefix("scroll", maniaTypes[mania][note.noteData] + "0");
	note.animation.addByPrefix("hold", maniaTypes[mania][note.noteData] + " hold piece");
	note.animation.addByPrefix("holdend", maniaTypes[mania][note.noteData] + " hold end");
	}
	


}

function onPreGenerateStrums(e) {
	for (i in strumLines.members)
		i.strumAnimPrefix = switch (mania) {
			case 0: ['none'];
			case 1: ["up"];
			case 2: ["left", "right"];
			case 3: ["left", "space", "right"];
			case 4: ["left", "down", "up", "right"];
			case 5: ["left", "down", "space", "up", "right"];
			case 6: ["left", "up", "right", "left", "down", "right"];
			case 7: ["left", "up", "right", "space", "left", "down", "right"];
			case 8: ["left", "down", "up", "right", "left", "down", "up", "right"];
			case 9: ["left", "down", "up", "right", "space", "left", "down", "up", "right"];
		}
	e.amount = strumLines.members[0].strumAnimPrefix.length;
}

function onStrumCreation(e) {
	e.cancel();
	var strum = e.strum;
	strum.frames = Paths.getFrames("game/shaggyNotes");
	strum.scale.set(maniaScales[mania], maniaScales[mania]);
	strum.animation.addByPrefix('static', 'arrow' + e.animPrefix.toUpperCase());
	strum.animation.addByPrefix('pressed', maniaTypes[mania][e.strumID] + ' press', 24, false);
	strum.animation.addByPrefix('confirm', maniaTypes[mania][e.strumID] + ' confirm', 24, false);
	strum.getPressed = () -> Reflect.getProperty(FlxG.keys.pressed, keyBinds[mania][strum.ID]);
	strum.getJustPressed = () -> Reflect.getProperty(FlxG.keys.justPressed, keyBinds[mania][strum.ID]);
	strum.getJustReleased = () -> Reflect.getProperty(FlxG.keys.justReleased, keyBinds[mania][strum.ID]);

}

function onNoteHit(e) {
	if(e.note.noteTypeID == 0){
		e.showSplash = false;
		e.cancelAnim();
		for (char in e.characters)
			if (char != null)
				if(mania <= 3) {
					char.playAnim("sing" + singDir[4][e.note.extra.get("dir")], e.forceAnim, "SING");}
				else {
					char.playAnim("sing" + singDir[mania][e.direction], e.forceAnim, "SING");
				}
			}
	}

function postCreate() {
	for (strum in strumLines){
		for (note in strum.notes)
			note.scale.x = note.scale.y = maniaScales[mania];
	}
	for (i in 0...strumLines.length){
		for (e in 0...strumLines.members[0].length)
			strumLines.members[i].members[e].x -= 1000;
	}
	for (i in 0...strumLines.length){
		if (strumLines.members[i].opponentSide)
			for (e in 0...strumLines.members[0].length)
				strumLines.members[i].members[e].x = 100 + (e * 150 * maniaScales[mania]);
		else
			for (e in 0...strumLines.members[0].length)
				strumLines.members[i].members[e].x = 700 + (e * 150 * maniaScales[mania]);
	}
	switch(mania){
		case 1:
			strumLines.members[1].members[0].x = 700 + 100;
			strumLines.members[0].members[0].x = 200 + 100;
		case 2:
			for(i in [0,1]){
				strumLines.members[1].members[i].x = 700 + (130 * i);
				strumLines.members[0].members[i].x = 200 + (130 * i) + 100;
			}
		case 7:
			for(i in 0...strumLines.length){
				if(strumLines.members[i].opponentSide == true){
					for(e in 0...7){
						strumLines.members[i].members[e].x = -1000;
					}
				
				} else {
						
					for(e in 0...7){
						strumLines.members[i].members[e].x = 250;
					}
					for(eee in 0...7){
						strumLines.members[i].members[eee].x += (110 * eee);
					}
				}
			}
		case 8:
			for(i in 0...strumLines.length){
				if(strumLines.members[i].opponentSide == true){
					for(e in 0...8){
						strumLines.members[i].members[e].x = -1000;
					}
				
				} else {
						
					for(e in 0...8){
						strumLines.members[i].members[e].x = 180;
					}
					for(eee in 0...8){
						strumLines.members[i].members[eee].x += (110 * eee);
					}
				}
			}
		case 9:
			for(i in 0...strumLines.length){
				if(strumLines.members[i].opponentSide == true){
					for(e in 0...9){
						strumLines.members[i].members[e].x = -1000;
					}
				
				} else {
						
					for(e in 0...9){
						strumLines.members[i].members[e].x = 140;
					}
					for(eee in 0...9){
						strumLines.members[i].members[eee].x += (110 * eee);
					}
				}
			}
		default:
			var cumerda = 0;
			switch(mania){
				case 6:
					cumerda = -30;
				case 5:
					cumerda = -20;
				case 3: cumerda = 70;
			
			
			}
			for(i in 0...strumLines.length){
				for(e in 0...strumLines.members[0].members.length){
					strumLines.members[i].members[e].x += cumerda; 
				}
			}
	}

}
