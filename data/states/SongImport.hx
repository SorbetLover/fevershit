// var brightenShader = FlxG.state.stateScript.get("brightenShader"); // kinda weird way of getting it but cameras break on static vars.

// var xml = FlxG.state.stateScript.get("xml");
// var stageGroup = FlxG.state.stateScript.get("stageGroup");

// var sprList = FlxG.state.stateScript.get("sprList");
// var spriteMap = FlxG.state.stateScript.get("spriteMap");
// var charMap = FlxG.state.stateScript.get("charMap");
import sys.io.File;
import sys.FileSystem;
import funkin.editors.ui.UIText;
import funkin.editors.ui.UIButton;
import funkin.editors.ui.UITextBox;
import funkin.editors.ui.UINumericStepper;
import funkin.editors.ui.UICheckbox;
import funkin.editors.ui.UIFileExplorer;
import lime.system.System;
import funkin.editors.charter.Charter;

var song:UITextBox;
var importee:UIButton;
function postCreate() {
	song = new UITextBox(100,100, "grando", 300, 30);
	add(song);

	importee = new UIButton(100,150, "import", function(){
		save(song.label.text);
	}, 75);
	importee.frames = Paths.getFrames("editors/ui/grayscale-button");

	add(importee);
}
function save(sng){
	file = "Zfrenzy_152/assets/data/" + sng + "/" + sng + "-hard.json";
	trace(File.getContent(file));
	if(FileSystem.exists("mods/fevershit/songs/" + sng) == false){
		FileSystem.createDirectory("mods/fevershit/songs/" + sng); 
		
		FileSystem.createDirectory("mods/fevershit/songs/" + sng + "/charts"); 
		FileSystem.createDirectory("mods/fevershit/songs/" + sng + "/song"); 
		FileSystem.createDirectory("mods/fevershit/songs/" + sng + "/scripts"); 
	}
	// File.saveContent("mods/fevershit/songs/" + sng + "/charts/", file);
	File.copy("Zfrenzy_152/assets/data/" + sng + "/" + sng + "-hard.json", "mods/fevershit/songs/" + sng + "/charts/hard.json");
	File.copy("Zfrenzy_152/assets/songs/" + sng + "/Inst.ogg", "mods/fevershit/songs/" + sng + "/song/Inst.ogg");
	File.copy("Zfrenzy_152/assets/songs/" + sng + "/Voices.ogg", "mods/fevershit/songs/" + sng + "/song/Voices.ogg");
	// PlayState.loadSong(sng, "hard");
	FlxG.switchState(new Charter(sng, "hard"));
}

function update() {

	if (FlxG.keys.justPressed.ESCAPE)
		close();

}

