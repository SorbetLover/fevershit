import funkin.editors.EditorPicker;

function update(){
	if (FlxG.keys.justPressed.SEVEN) {
		persistentUpdate = false;
		persistentDraw = true;
		openSubState(new EditorPicker());
	}
}