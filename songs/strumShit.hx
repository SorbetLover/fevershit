var pathshit:String = "";
var enableNotes:Bool = false;
var enemy = strumLines.members[0].characters[0].curCharacter;
function onStrumCreation(e){
			if(StringTools.startsWith(enemy, "scarlet") || StringTools.startsWith(enemy, "robo")){
				if(e.player == 0)
				e.sprite = "game/notes/ROBO-NOTE_assets";
				pathshit = e.sprite;
				enableNotes = true;
			
			}

			else if(enemy == "taki-new" && e.player == 0){
				e.sprite = "game/notes/takiNotes";
				pathshit = e.sprite;
				enableNotes = true;
			}
			else if(enemy == "yukichi"){
				e.sprite = "game/notes/yukichiNotes";
				pathshit = e.sprite;
				enableNotes = true;
			}
			
			
}

function onNoteCreation(e){
	if(enableNotes && e.strumLineID == 0){
		e.noteSprite = pathshit;
	}

	if(e.noteType == "hallow"){
		e.noteSprite = "game/notes/hallowNotes";
	}
}